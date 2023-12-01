FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y build-essential wget curl  
RUN  mkdir -p /server
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN apt-get -y install nodejs
COPY . /server/
WORKDIR /server/
CMD nvm install 18.15.0
CMD nvm use 18.15.0
CMD npm install
CMD npm start 
