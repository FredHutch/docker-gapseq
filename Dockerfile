FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ncbi-blast+ git libglpk-dev r-base-core exonerate bedtools barrnap bc parallel libcurl4-openssl-dev libssl-dev
RUN R -e 'install.packages(c("data.table", "stringr", "sybil", "getopt", "doParallel", "foreach", "R.utils", "stringi", "glpkAPI", "CHNOSZ", "jsonlite", "httr"))'
RUN R -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install("Biostrings")'
RUN git clone https://github.com/jotech/gapseq && cd gapseq && ln -s $PWD/gapseq /usr/local/bin/
RUN gapseq -v
