FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y build-essential curl
RUN mkdir -p /server
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN source ~/.bashrc
RUN rm -rf /etc/localtime 
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN apt-get install -y nodejs npm 
COPY . /server/
WORKDIR /server/
RUN nvm install 18.15.0
RUN nvm use 18.15.0
RUN npm install
RUN npm start 
