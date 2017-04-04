FROM ethereum/client-go

# # our own custom bult geth that mines really fast
# COPY geth /usr/bin/geth

# script that invokes with all those
# command line options
COPY rungeth.docker /usr/bin/rungeth

# these two files and directory of geth state belong together and must be
# kept in sync if changes  are ever made
# Note we are taking advantage of Docker's copy-on-mount feature
COPY geth.password /root/geth.password
COPY genesis.json  /root/genesis.json
COPY ethereum /root/.ethereum

ENTRYPOINT ["/usr/bin/rungeth"]

# use non-standard ports so don't accidently connect to real servers
# XXX Docker inheritance doesn't override, it extends the port      list...
EXPOSE 8110
EXPOSE 30310
EXPOSE 6110
