FROM ubuntu:18.04

# Essential
RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    build-essential \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Tools
RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    curl less vim wget \
    git \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Libraries
RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    libpcre++-dev libssl-ocaml-dev libz-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY compile.sh /

CMD /bin/bash
