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
     DESCAPT_URL_FOR_CRAWLING,
    'https://www.epocacosmeticos.com.br/'
)
DESCAPT_HTML_DICT = {
    'MAIN_HTML_SECTION': ,
    'OBJECTS_TO_SEARCH': {
        'PRICE':
        'NAME':
        'URL'
    }
}