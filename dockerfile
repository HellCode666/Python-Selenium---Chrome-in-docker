FROM python:latest

RUN su

RUN pip install selenium

RUN apt-get install -y wget

RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

RUN apt-get update && apt-get -y install google-chrome-stable

ADD ./p.py /p.py   

ADD ./chromedriver /chromedriver

RUN chmod +x chromedriver

RUN mv -f chromedriver /usr/local/share/chromedriver

RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver

RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

CMD [ "python", "/p.py"]