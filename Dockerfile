FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y build-essential curl
RUN mkdir -p /app
COPY . /app/
WORKDIR /app/server/
RUN rm -rf /etc/localtime 
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN ["/bin/bash", "-c", "source ~/.bashrc"]
RUN cat ~/.bashrc
RUN curl -s https://deb.nodesource.com/setup_18.x | bash
RUN  apt install nodejs -y
RUN apt-get install -y npm 
RUN npm install -g npm@9.5.0
RUN npm start
