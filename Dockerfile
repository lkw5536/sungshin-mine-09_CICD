FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y build-essential curl
RUN mkdir -p /app
RUN rm -rf /etc/localtime 
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
RUN echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"  # This loads nvm" >> ~/.bashrc
RUN echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"  # This loads nvm" >> ~/.bashrc
RUN source ~/.bashrc
RUN apt-get install -y npm 
RUN  nvm install 18.15.0
RUN  nvm use 18.15.0
RUN  nvm alias default 18.15.0
COPY . /app/
WORKDIR /app/server/
RUN  npm install -g npm@9.5.0
RUN npm start
