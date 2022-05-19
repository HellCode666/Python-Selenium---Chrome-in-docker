import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options

while True:

        options = Options()

        options.add_argument('--no-sandbox')
        options.add_argument('--window-size=1420,1080')
        options.add_argument('--headless')
        options.add_argument('--disable-gpu')

        browser = webdriver.Chrome(options=options, executable_path='/usr/local/bin/chromedriver')
        browser.get('https://google.com')
        print('Title: %s' % browser.title)
        time.sleep(3)
        browser.quit()
        