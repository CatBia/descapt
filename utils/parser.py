# This is a python script with 
# scripts to parse bs4.BeautifulSoap objects
# For futher informations, read the __doc___ method
# from each method/class

from bs4 import BeautifulSoup
from configurations import (
    DESCAPT_DEFAULT_PATTERNS_TO_SEARCH,
    DESCAPT_CAPTURE_PATTERN
)
import logging
import re

def name_getter(val):
    compiler = re.compile(r"{(.*?)}")
    return compiler.findall(val)

def is_url(BSObject):
    """
    Returns True when the given variable have the 'href' key/property
    and False if the opposite happens
    BSObject:: <BeautifulSoap> Object
    """
    has_url = BSObject.get('href')
    if has_url:
        return True
    return False

def directives(patt_to_search):
    """
    Returns a new <dict> object, with instructions to how search the
    desirable key in html section
    patt_to_search:: <tuple>

    """
    keys = ('tag', 'attr', 'text')
    copy_patt_to_search = patt_to_search
    for patt in copy_patt_to_search:
        if type(patt) == list:
            for i, subpatt in enumerate(patt):
                patt[i] = {
                    'attr': subpatt[0] if type(subpatt) == tuple else subpatt,
                    'value': subpatt[1] if type(subpatt) == tuple else None,
                    'name': name_getter(subpatt[1]) if type(subpatt) == tuple else None,
                }
                if patt[i].get('name') in (None, []):
                    patt[i].pop('name', None)
                elif list(patt[i].get('name')):
                    patt[i]['name'] = patt[i]['name'].pop()
    return dict(zip(keys, copy_patt_to_search))

def get_all_directives(patterns_to_search=False):
    """
    Return all directives from a given pattern
    patterns_to_search:: <list> list of patterns
    """
    all_directives = []
    if not patterns_to_search:
        patterns_to_search = DESCAPT_DEFAULT_PATTERNS_TO_SEARCH
    for pattern in patterns_to_search:
        all_directives.append(directives(pattern))
    return list(all_directives)


def _get_attr(BSObject, attr, value):
    pattern = attr.split(value)
    keys = [k for k in BSObject.attrs.keys() if all([ w in k for w in pattern])]
    return keys

def _get_val(_string, value):
    pattern = value.split(value)
    patt_name = name_getter(value)
    if patt_name:
        if pattern:
            word = _string
            for s in pattern:
                word = word.replace(s, '')
            return word, patt_name.pop()
    else:
        if _string == value:
            return _string, False
    return False




def get_directives_objects(BSObject, patterns_to_search=False):
    """
    Return objects from a BeautifulSoap object, given a
    list of pattern directives.
    BSObject:: <BeautifulSoap> Object
    patterns_to_search:: <list> list of patterns
    """
    all_captured = []


    all_directives = get_all_directives(patterns_to_search)
    for directive in all_directives:
        bso = BSObject.find_all(directive.get('tag'))
        for _obj in bso:
            _attr = directive.get('attr')
            _text = directive.get('text')
            if _attr != None:
                for a_p in _attr:
                    a_p_attr, a_p_value = a_p.get('attr'), a_p.get('value')
                    a_p_name = a_p.get('name')
                    all_attributes_avaliable = _get_attr(_obj, a_p_attr, a_p_value)
                    for attrs in all_attributes_avaliable:
                        received = _get_val(_obj.get(attrs), a_p_value)
                        if received:
                            rec, _ = received
                            capture = {}
                            if _text != None:
                                a_p_text, a_p_text_name = _get_val(_obj.text, _text)
                                capture[a_p_text_name or 'text'] = a_p_text
                            capture[a_p_name or attrs] = rec
                            if not capture in all_captured:
                                all_captured.append(capture)

    return all_captured



