# This is a python script with 
# scripts to parse bs4.BeautifulSoap objects
# For futher informations, read the __doc___ method
# from each method/class

from bs4 import BeautifulSoup
from configurations import (
    DESCAPT_DEFAULT_PATTERNS_TO_SEARCH,
    DESCAPT_CAPTURE_PATTERN
)

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
                    'value':subpatt[1] if type(subpatt) == tuple else None
                }
    return dict(zip(keys, copy_patt_to_search))

def get_all_directives(patterns_to_search=False):
    all_directives = []
    for 
        
def translate_directives(BSObject, patterns_to_search=False):
    translations = []
    if not patterns_to_search:
        patterns_to_search = DESCAPT_DEFAULT_PATTERNS_TO_SEARCH

    

    for dir in all_directives:
        tag_result = getattr(BSObject, dir.get('tag'))
        translations.append(tag_result)
    return translations