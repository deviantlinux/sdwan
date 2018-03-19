FROM ubuntu
RUN apt update ; apt install -y openvpn openssl
WORKDIR /client
ADD . /client
CMD /client/start.sh
