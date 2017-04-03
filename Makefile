build:
		docker build -t ethereum/client-go:test .

rpc:
		docker run --name geth -d -p 8110:8110 ethereum/client-go:test

kill:
		docker rm -f geth

test:
		curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x27dc8de9e9a1cb673543bd5fce89e83af09e228f", "latest"],"id":1}' localhost:8110
