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
                name_getter = re.compile(r"{(.*?)}")
                patt[i] = {
                    'attr': subpatt[0] if type(subpatt) == tuple else subpatt,
                    'value': subpatt[1] if type(subpatt) == tuple else None,
                }
                if patt[i].get('name'):
                    if patt[i]['name']) == 0:
                        patt[i].pop('name', None)
                    else:
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

def get_patterns(word, pattern):

    global_searcher = '("{}.*?")'



def _get_attr(BSObject, attr):
    pattern = attr.split('{}')
    keys = [k for k in BSObject.attrs.keys() if all([ w in k for w in pattern])]
    return keys

def _get_val(_string, value):
    pattern = value.split('{}')
    word = _string
    for s in pattern:
        word = word.replace(s, '')
    return word



def get_directives_objects(BSObject, patterns_to_search=False):
    """
    Return objects from a BeautifulSoap object, given a
    list of pattern directives.
    BSObject:: <BeautifulSoap> Object
    patterns_to_search:: <list> list of patterns
    """
    objects = []

    all_directives = get_all_directives(patterns_to_search)

    for directive in all_directives:
        _obj = getattr(BSObject, directive.get('tag'))
        _attr = directive.get('attr')
        _text = directive.get('text')
        if _attr != None:
            for a_p in _attr:
                a_p_name, a_p_value = a_p.get('attr'), a_p.get('value') 
                all_attributes_avaliable = _get_attr(_obj, a_p_name)
                for attrs in all_attributes_avaliable:
                    received = _get_val(_obj.get(attrs), a_p_value)
                    objects.append({attrs:received})
    return objects



