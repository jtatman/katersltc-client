FROM ubuntu:20.04 as builder
LABEL maintainer="James Tatman <tatman@tatmantech.com>"

# Essential packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y git ca-certificates build-essential gcc make libupnp-dev libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libdb5.3++-dev libdb5.3-dev libminiupnpc-dev && apt-get clean

# Run build script
RUN git clone https://github.com/jtatman/katersltc-client.git && \
    cd katersltc-client/src && \
    make -f makefile.unix STATIC=1 RELEASE=1 -j$(nproc) && \
    strip -s katersltcd && \
    cp -v katersltcd /usr/bin


FROM ubuntu:20.04
COPY --from=builder /usr/bin/katersltcd /usr/bin
# Start katersltcd
WORKDIR /root
RUN mkdir .katersltc && \ 
    echo "rpcuser=katersltcrpc" > .katersltc/katersltc.conf && \
    echo -n "rpcpassword=" >> .katersltc/katersltc.conf && \ 
    (tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1 >> .katersltc/katersltc.conf) && \
    cat /root/.katersltc/katersltc.conf

EXPOSE 33666 33667
VOLUME [ "/root/.katersltc" ]

ENTRYPOINT ["katersltcd", "-detachdb", "-printtoconsole", "-debug", "-netdebug", "-logtimestamps", "-gen"]
