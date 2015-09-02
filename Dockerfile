FROM node

RUN apt-get update && apt-get install -y xvfb chromium

ADD docker_settings/xvfb-chromium /usr/bin/xvfb-chromium
RUN chmod 777 /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

RUN adduser --disabled-password  --gecos "" devuser; \
  echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


RUN npm install -g bower gulp yo 

RUN chown -R devuser:devuser /usr/local/bin/npm
