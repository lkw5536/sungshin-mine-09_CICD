FROM ubuntu:20.04
ENV NODE_VERSION 18.15.0
ENV NVM_DIR /usr/local/nvm
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN apt-get update && apt-get install -y build-essential curl && mkdir -p /app && mkdir $NVM_DIR
COPY . /app/
WORKDIR /app/server/
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN echo "source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default" | bash
RUN apt-get install -y npm && npm install -g npm@9.5.0 && npm install express
CMD npm start
