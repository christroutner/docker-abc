#!/bin/bash
docker container run --name bitcoind-testnet -d \
-p 18332:18332 -p 18333:18333 -p 38333:38333 \
-v /media/usb/full-nodes/testnet/abc-testnet:/data \
bitcoind-testnet
