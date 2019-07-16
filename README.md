# docker-abc
A BCH full node based on the ABC reference implementation. This repo has a
sister repo, [docker-abc-rpi](https://github.com/christroutner/docker-abc-rpi), which
is the same idea but targeted for a Raspberry Pi v3 B+ minicomputer.

This repository specifically targets the hard drive and micro-server platform
described at [bchjs.cash](https://bchjs.cash).

# Installation and Usage
- It's assumed that you are starting with a fresh installation of Ubuntu 18.04
LTS on a 64-bit machine. It's also assumed that you are installing as
a [non-root user with sudo privileges](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04).

- Install Docker on the host
system. [This tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04) shows
how to install Docker on a Ubuntu system. It's specifically targeted to Digital
Ocean's cloud servers, but should work for any Ubuntnu system.

- Install Docker Compose too. [This tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)
shows how to do so on a Ubuntu system.

- Clone this repository in your home directory with the following command:

`git clone https://github.com/christroutner/docker-abc`

- Build the docker container by running the build script:

`docker-compose build`

- Customize the `volumes` setting in the [docker-compose.yml](docker-compose.yml)
file in order to choose where you want the blockchain data stored.

- Run the container:

`docker-compose up -d`

- Check on the status of bitcoind as it syncs to the blockchain:

`sudo tail ../blockchain-data/bch-mainnet-abc-rpi/debug.log`

- Or query the JSON RPC:

`curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getnetworkinfo","params":[]}' -H 'content-type:text/plain;' http://bitcoin:password@127.0.0.1:8332/`

`curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://bitcoin:password@127.0.0.1:8332/`

## Testnet
This repository has a `hd-testnet` branch that customizes the files in this
repository for testnet.
