#!/bin/bash
docker container run --name bitcoind-hd -d \
-p 8332:8332 -p 8333:8333 -p 28332:28332 \
-v /media/usb/full-nodes/mainnet/blockchain-data/bch-mainnet-abc:/data \
bitcoind-hd
