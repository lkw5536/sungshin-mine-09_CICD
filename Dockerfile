FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y build-essential wget curl
RUN mkdir -p /server
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN source ~/.bashrc
RUN sudo rm -rf /etc/localtime && sudo ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN apt-get install -y nodejs npm
COPY . /server/
WORKDIR /server/
CMD nvm install 18.15.0
CMD nvm use 18.15.0
CMD npm install
CMD npm start 
