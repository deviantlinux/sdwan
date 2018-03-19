FROM ubuntu
RUN apt update ; apt install -y openvpn openssl curl wget ping
WORKDIR /client
ADD . /client
CMD /client/start.sh
