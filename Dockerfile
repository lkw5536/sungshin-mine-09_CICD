FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y build-essential curl
RUN mkdir -p /server
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN ["/bin/bash", "-c", "source ~/.bashrc"]
RUN rm -rf /etc/localtime 
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN apt-get install -y nodejs npm 
COPY . /server/
WORKDIR /server/
ENV NVM_DIR ~/.nvm
ENV NODE_VERSION 18.15.0
RUN ["/bin/bash", "-c", ". $NVM_DIR/nvm.sh", "nvm install $NODE_VERSION"]
CMD nvm use 18.15.0
CMD npm install
CMD npm start 
