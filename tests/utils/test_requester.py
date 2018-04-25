
from unittest import TestCase, mock
from bs4 import BeautifulSoup
from utils import requester, parser
import logging
import copy
from configurations import(
    DESCAPT_URL_FOR_CRAWLING
)

class BasicTests(TestCase):
    # Default behaviour from requester.Requester().get_soup
    def test_get_soup(self):
        req = requester.Requester()
        text = req.get_soup(url='https://www.gnu.org/')
        self.assertTrue(text)

class ParsingTests(TestCase):
    def setUp(self):
        self.req = requester.Requester()
        self.bsdocument = self.req.get_soup(url='https://www.gnu.org/')
    def test_default_behavior(self):
        pattern = [
            ('link', [('hreflang', '{lang}'), ('href', '{lang_url}')])
        ]
        all_langs = parser.get_directives_objects(self.bsdocument, pattern)
        self.assertEqual(len(all_langs), 20) #until 4/23/2018
        self.assertTrue(
            all(
                [
                    all(
                        [
                            lang.get('lang'),
                            lang.get('lang_url')
                        ] for lang in all_langs
                        )
                ]
                )
        )

    def test_default_behavior_only_one(self):
        pattern = [
            ('link', [('hreflang', 'pt-br'), ('href', '{lang_url}')])
        ]
        expected_return = [
            {'hreflang': 'pt-br', 'lang_url': '/home.pt-br.html'}
        ]
        received_return = parser.get_directives_objects(
            self.bsdocument, pattern)

        self.assertEqual(
            received_return,
            expected_return
        )

    def test_w_current_url(self):
        """ text = ''
        with open('aaa.html', 'r') as _file:
            text = _file.read()
        
        bsobject = BeautifulSoup(text, 'html.parser')
        bsobjects = bsobject.children """
        bsobjects = self.req.get_soup(DESCAPT_URL_FOR_CRAWLING)
        pattern = [
            ('shelf-default__link', [('href', '{url}')], None)
        ]

        all_front_urls = parser.get_directives_objects(
            bsobjects,
            list(pattern)
        )

        for url in all_front_urls:
            bso = self.req.get_soup(url.get('url'))
            subpattern = [
                ('product__floating-info--name', [('class', '{class}')], '{text}')
            ]
            logging.warning(parser.get_directives_objects(
            bso,
            list(subpattern)
            ))
            divframes, driver = bso.find_all('div', attrs={'data-widget': 'ultimatebuy'})
            for div in divframes:
                #name= div.get('name')
                #if 'chaordic' in name:
                frame = div.iframe
                if frame:
                    frames = driver.find_elements_by_xpath("//iframe[@name='%s']" % frame.get('name'))
                    logging.warning(frames)
            divframes, driver = bso.find_all('div', attrs={'data-widget':'historypersonalized'})
            for div in divframes:
                #name= div.get('name')
                #if 'chaordic' in name:
                frame = div.iframe
                if frame:
                    frames = driver.find_elements_by_xpath("//iframe[@name='%s']" % frame.get('name'))
                    logging.warning(frames)
            raise AssertionError
        
        