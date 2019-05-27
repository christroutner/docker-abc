#!/bin/bash
docker container run --name bitcoind-testnet -d \
-p 8332:8332 -p 8333:8333 -p 18332:18332 -p 18333:18333 -p 28333:28333 \
-v /home/safeuser/testnet-blockchain-data:/data \
--rm \
bitcoind-testnet
