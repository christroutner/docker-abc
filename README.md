# docker-abc
A BCH full node based on the ABC reference implementation. This repos is forked
from [docker-abc-rpi](https://github.com/christroutner/docker-abc-rpi), which
is the same idea but targeted for a Raspberry Pi v3 B+ minicomputer.

This version of that repository is modified to run directly on my computer. I
occasionally need direct access to a full node when I travel, so installing a
Docker container I can fire up and sync works well. I don't normally run the full
node in the background as it takes significant resources.

The blockchain is stored on an auxiliary, slower hard drive for storing such things.
Keeping the software contained in a Docker container allows me to turn it on and
off at my leisure.

# Installation and Usage
- Clone this repository in your home directory with the following command:
`git clone https://github.com/christroutner/docker-abc`

- Build the docker container by running the build script: `./build-image.sh`

- Run the container with the run script: `./run-image.sh`

- Check on the status of bitcoind as it syncs to the blockchain:
`sudo tail /mnt/data/bitcoin.com/blockchain-data/bch-mainnet-abc-rpi/debug.log`

- Or query the JSON RPC:

`curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getinfo","params":[]}' -H 'content-type:text/plain;' http://bitcoin:password@127.0.0.1:8332/`

`curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://bitcoin:password@127.0.0.1:8332/`
