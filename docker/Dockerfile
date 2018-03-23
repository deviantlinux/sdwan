FROM ubuntu
RUN apt update ; apt install -y openvpn openssl curl wget
WORKDIR /sdwan
ADD . /sdwan
CMD /sdwan/start.sh
