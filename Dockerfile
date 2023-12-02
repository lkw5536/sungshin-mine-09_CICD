FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y build-essential curl
RUN mkdir -p /server
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN ["/bin/bash", "-c", "source ~/.bashrc"]
RUN source ~/.nvm/nvm.sh && nvm install 18.15.0 && nvm use 18.15.0
RUN rm -rf /etc/localtime 
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN apt-get install -y nodejs npm 
COPY . /server/
WORKDIR /server/
CMD npm install
CMD npm start 
