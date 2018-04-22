#!/usr/bin python3.6

# Configuration script for descapt
#Remember read this before PRODUCTION!
#Keep testing. Success.

import os

##################################################
####   DEVELOPMENT AND DEBUG ENVIRONMENT      ####
##        unset DEBUG for PRODUCTION            ##
#                                                #
DEBUG = bool(os.environ.get('DEBUG'))
#                                                #
##################################################

# # # # # # # # # # # # # # # # # # # # # # # # #
#################################################
#               Proxy configurations            #

DESCAPT_REQUEST_PROXY_PROTOCOL = os.environ.get(
    'DESCAPT_REQUEST_PROXY_PROTOCOL')
DESCAPT_REQUEST_PROXY_URL = os.environ.get(
    'DESCAPT_REQUEST_PROXY_PROTOCOL')
DESCAPT_REQUEST_PROXY_PORT = os.environ.get(
    'DESCAPT_REQUEST_PROXY_PROTOCOL')

##################################################

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
##################################################
## #     Some few arguments for scrapping     # ##
DESCAPT_URL_FOR_CRAWLING = os.environ.get(
     'DESCAPT_URL_FOR_CRAWLING',
    'https://www.epocacosmeticos.com.br/'
)

"""
This is an array which contains tuples
tha contains another arrays...
Let's see the logic behind this madness:

HTML1 EXAMPLE:
<html>
    <title>HTML Tutorial</title>
    <body>
        <h1 id='id1'>This is a heading</h1>
        <h1 id='id2'>This is other heading</h1>
        <p>This is a paragraph.</p>
        <p>This is a trap.</p>
    </body>
</html>

Pattern:
(<tag>, <attribute>, <text>)
 A) get p's text:
 ('p', None, '{}') # ['This is a paragraph', 'This is a trap']
 
 B) get p's part of the text
 ('p', None, 'This is a {}') ['paragraph', 'trap']
 
 C) get h1's text when id is 'id2'
 ('h1', [('id', 'id2')], '{}') ['This is other heading']
 
 D) get h1's id attribute when text is 'This is a heading'
 ('h1', [('id', '{}')], 'This is a heading') ['id1']


"""
DESCAPT_CAPTURE_PATTERN= '{}'

DESCAPT_DEFAULT_PATTERNS_TO_SEARCH = [
    ('title', None, None), 
    ('a', [('class', 'details product-name'),('href', '{}')], '{}'),
]

try:
    from custom_config import *
except:
    pass
    
