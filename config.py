#!/usr/bin/env python3.6

"""
Configuration file for descapt project
You can run your custom settings at custom_config.py file

`DEBUG` can be environment variable too.
`os.environ` can't assign `False` values. Be careful.
"""

import os

#####################################
# # # # DEBUG MODE - BE CAREFUL # # #
DEBUG=False
#####################################

# # # DESCAPT MAIN CONFIGURATION # # #

#URL to be scrapped
DESCAPT_SCREPPING_URL = 

"""Information format:
Some information can be in cascade, like:
(A)
<div id='key1'>
   <div id='subkey1'>
      <p> INFORMATION </p>
   <\div>
<\div>
And here, you can set like:

info_pattern = {
    'key': {
        'identifier': 'id',
        'value': 'key1'
        },
    'type': 'div',
    'has_info': False
    'subkeys': [
        {
            'key': {
                'identifier': 'id',
                'value': 'subkey1'
            }
            'type' 'div'
            'has_info': False,
            'subkeys': [
                {
                    'key': None,
                    'type': 'p',
                    'has_info': '{begintype}{info}{endtype}'
                    'subkeys': None
                }
            }
        ]
    ]
}



"""