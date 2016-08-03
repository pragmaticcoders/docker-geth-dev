===============
Docker-geth-dev
===============

This runs a container with private ethereum chain with some precreated accounts
and balances. This is a result of following the steps described in SO thread:
http://ethereum.stackexchange.com/questions/1516/how-can-i-completely-automate-a-docker-image-and-dockerfile-for-a-geth-test-netw and fixing the problems which
occured on the way.

1. Build the container: ::

     docker build -t ethereum/client-go:test .


2. Run as standalone command: ::

     docker run --name geth -d -p 8110:8110  ethereum/client-go:test

   Please note that the non-standard port is used for RPC server, so be sure to
   configure your client accordingly.


3. Run as part of docker-compose: ::

     geth:
       image: ethereum/client-go:test
     ports:
       - "8110:8110"


Precreated accounts
===================

- `de1e758511a7c67e7db93d1c23c1060a21db4615` (initial balance: 1000 ether).
  This account is used as a coinbase for mining, so it will have plenty of ether
  fast.

- `27dc8de9e9a1cb673543bd5fce89e83af09e228f` (initial balance: 1100 ether)

- `d64a66c28a6ae5150af5e7c34696502793b91ae7` (initial balance: 900 ether)

All the accounts have the same passphrase: `password`


Example: check balance with RPC call
====================================

::

  curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["27dc8de9e9a1cb673543bd5fce89e83af09e228f", "latest"],"id":1}' localhost:8110
  {"jsonrpc":"2.0","id":1,"result":"0x44c"}

(0x44c is hex for 1100)
