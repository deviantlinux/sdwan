FROM ubuntu
RUN apt update ; apt install -y openvpn 
WORKDIR /client
ADD .
