FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    fastqc default-jre perl python3 python3-pip wget ca-certificates gzip \
 && pip3 install --no-cache-dir cutadapt multiqc \
 && wget -qO /usr/local/bin/trim_galore https://raw.githubusercontent.com/FelixKrueger/TrimGalore/master/trim_galore \
 && chmod +x /usr/local/bin/trim_galore \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /data
ENTRYPOINT ["/bin/bash"]
