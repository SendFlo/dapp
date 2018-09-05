FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends bsdtar git curl iputils-ping sudo ca-certificates build-essential gnupg2 \
    && curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && export tar='bsdtar' \
    && adduser --disabled-password --gecos '' doichain && \
    adduser doichain sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN git clone https://github.com/Doichain/dapp.git /home/doichain/dapp --depth=1 --branch=0.0.6 && cd /home/doichain/dapp && git submodule init && git submodule update 
USER doichain
WORKDIR /home/doichain/dapp

RUN export tar='bsdtar' && sudo curl https://install.meteor.com/ | sh && \
sudo chown -R doichain:doichain /home/doichain/dapp && \
cd /home/doichain/dapp && meteor npm install && meteor npm install --save bcrypt @babel/runtime && \
meteor build build/ --architecture os.linux.x86_64 --directory && \
cd /home/doichain/dapp/build/bundle/programs/server && npm install &&  npm install --save bcrypt
