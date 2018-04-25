import os
from selenium import webdriver
import time
from selenium.webdriver.chrome.options import Options
import logging
from bs4 import BeautifulSoup
from configurations import (
    DESCAPT_REQUEST_PROXY_PORT,
    DESCAPT_REQUEST_PROXY_URL,
    DESCAPT_REQUEST_PROXY_PROTOCOL,
    DEBUG,
    CHROMEWEBDRIVER_PATH
)

class Requester(object):
    def __init__(self, *args, **kwargs):
        options = Options()
        options.add_argument('--headless')
        options.add_argument('--disable-gpu')
        if DEBUG:
            logging.warning(
                """
                WARNING: USING DEBUG MODE, W/OUT A PROXY
                SET A PROXY in custom_config.py
                or
                SET ENVIRONMENT VARIABLES
                SEE configuration.py FOR FURTHER INFORMATION
                """
            )
        else:
            proxy_url = '{protocol}://{url}:{port}'.format(
                protocol=DESCAPT_REQUEST_PROXY_PROTOCOL,
                url=DESCAPT_REQUEST_PROXY_URL,
                port=DESCAPT_REQUEST_PROXY_PORT

            )
            options.add_argument('--proxy-schema=%s' %proxy_url)
        self.driver = webdriver.Chrome(CHROMEWEBDRIVER_PATH, chrome_options=options)
    
    @staticmethod
    def wait_response(_driver):
        count = 0
        while not _driver.page_source or count <10:
            logging.warning('Waiting 3s for response...')
            time.sleep(3)
            count += 1
        if count > 10 and not _driver.page_source:
            logging.error('No page source found here')
            raise IOError('No page source found here')

    def get_soup(self, url):
        """
        Return a BeautifulSoup object from a html page in a given URL.
        
        url:: <str>
        """
        driver = self.driver

        driver.get(url)
        #self.wait_response(driver)
        
        page_source = driver.page_source
        bsobject = BeautifulSoup(page_source, 'html.parser')

        return bsobject, driver
    