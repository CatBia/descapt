"""
Test suite for utils.parser.py

Some features can depend of test variables for success.
See pytes.ini for further information.
"""

from unittest import TestCase, mock
from bs4 import BeautifulSoup
from utils import parser
import logging

class BasicTests(TestCase):
    def setUp(self):
        self.basic_html = """
        <!DOCTYPE html>
        <html>
        <title>HTML Tutorial</title>
        <body>

        <h1>This is a heading</h1>
        <p>This is a paragraph.</p>
        <a href='https://www.google.com'>Google</a>

        </body>
        </html>
        """

        
    #testing default behaviour of utils.parser.is_url
    def test_is_url(self):
        bsdocument = BeautifulSoup(self.basic_html, 'html.parser')
        bsoobject_html = bsdocument.a
        bsoobject_h1 = bsdocument.h1
        bsoobject_p = bsdocument.p

        
        self.assertTrue(parser.is_url(bsoobject_html))
        self.assertFalse(parser.is_url(bsoobject_h1))
        self.assertFalse(parser.is_url(bsoobject_p))
    
    #testing w/ a strange object
    def test_is_url_strange_object(self):
        strange_object = object

        with self.assertRaises(AttributeError):
            parser.is_url(strange_object)
    
    
    #testing the default behaviour of parser.utils.directives
    def test_directives(self):
        pattern_1 = ('tag1', 'attr1', 'text1')
        desireble_return_1 = {
            'tag': 'tag1',
            'attr': 'attr1',
            'text': 'text1'
        }
        given_return_1 = parser.directives(pattern_1)
        self.assertEqual(desireble_return_1, given_return_1)

        pattern_2 = ('tag1', [('attr1', 'value1.1')], 'text1')
        desireble_return_2 = {
            'tag': 'tag1',
            'attr': [{
                'attr': 'attr1',
                'value': 'value1.1'
            }],
            'text': 'text1'
        }
        given_return_2 = parser.directives(pattern_2)
        self.assertEqual(desireble_return_2, given_return_2)

        
        pattern_3 = ('tag1', [('attr1', 'value1.1'), ('attr2', 'value1.2')], 'text1')
        desireble_return_3 = {
            'tag': 'tag1',
            'attr': [
                {
                'attr': 'attr1',
                'value': 'value1.1'
                },
                {
                'attr': 'attr2',
                'value': 'value1.2'
                },
            ],
            'text': 'text1'
        }
        given_return_3 = parser.directives(pattern_3)
        self.assertEqual(desireble_return_3, given_return_3)


    def test_directives_wrong_pattern(self):
        pattern_4 = ('tag1', [('attr1'), ('attr2', 'value1.2')], 'text1')
        desireble_return_4 = {
            'tag': 'tag1',
            'attr': [
                {
                'attr': 'attr1',
                'value': None
                },
                {
                'attr': 'attr2',
                'value': 'value1.2'
                },
            ],
            'text': 'text1'
        }
        received_return_4 = parser.directives(pattern_4)
        self.assertEqual(received_return_4, desireble_return_4)

    #testing the default behaviour of utils.parser.translate directive
    def test_translate_directives(self):
        pattern_4 = ('tag1', [('attr1'), ('attr2', 'value1.2')], 'text1')
        bsdocument = BeautifulSoup(self.basic_html, 'html.parser')
        logging.warning(parser.translate_directives(bsdocument, pattern_4))
        raise AssertionError


        






        
