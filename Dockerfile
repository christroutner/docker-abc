FROM ubuntu:18.04
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

# Create bitcoin user and group.
RUN groupadd -r bitcoin && useradd -r -m -g bitcoin bitcoin

# Install basic software packages.
RUN set -ex \
	&& apt-get update \
	&& apt-get install -qq --no-install-recommends -y curl wget gpg sudo \
	software-properties-common gpg-agent

# create data directory
ENV BITCOIN_DATA /data
RUN mkdir "$BITCOIN_DATA"
RUN chown -R bitcoin:bitcoin "$BITCOIN_DATA"
RUN ln -sfn "$BITCOIN_DATA" /home/bitcoin/.bitcoin
COPY bitcoin.conf /home/bitcoin/bitcoin.conf
RUN chown -h bitcoin:bitcoin /home/bitcoin/.bitcoin

# Install Bitcoin Cash ABC
RUN add-apt-repository ppa:bitcoin-abc/ppa
RUN apt-get update
RUN apt-get install -y bitcoind


# These values will need to be set at run time.
VOLUME /data
EXPOSE 8332 8333 18332 18333


CMD ["bitcoind", "-conf=/home/bitcoin/bitcoin.conf", "-datadir=/data", "-disablewallet"]
