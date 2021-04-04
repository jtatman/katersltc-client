FROM ubuntu:bionic
RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get -y install gpg
RUN echo deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu xenial main >> /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D46F45428842CE5E
RUN apt-get update --fix-missing
# for development
#RUN apt-get -y install ccache git libboost-system1.62.0 libboost-filesystem1.62.0 libboost-program-options1.62.0 libboost-thread1.62.0 libboost-chrono1.62.0 libssl1.0.0 libevent-pthreads-2.1-6 libevent-2.1-6 build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev python-pip 
RUN apt-get -y install git libboost-system1.65.1 libboost-filesystem1.65.1 libboost-program-options1.65.1 libboost-thread1.65.1 libboost-chrono1.65.1 libdb4.8-dev libdb4.8++-dev libssl1.0.0 libevent-pthreads-2.1-6 libevent-2.1-6 python-pip 
RUN pip install construct==2.5.2 scrypt

ADD ./katersltcd /katersltcd 

#RUN mkdir -p /root/.katersltc
#COPY ./katersltc.conf /root/.katersltc/katersltc.conf 

VOLUME /root/.katersltc

EXPOSE 33701 33700
 
#CMD ["/katersltcd", "-listen", "-gen", "-discover", "-debug", "-printtoconsole", "-daemon"]
CMD ["/katersltcd", "-gen=1", "-debug", "-printtoconsole", "-logtimestamps", "-connect=192.168.1.10:33701"]
