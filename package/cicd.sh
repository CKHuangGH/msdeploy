#!/bin/bash

rm -rf /usr/local/bin/clusteradm

rm -rf clusteradm_mmc/

git clone https://github.com/CKHuangGH/clusteradm_mmc.git
chmod 777 clusteradm_mmc/
cd clusteradm_mmc/
make build

cp /root/go/bin/clusteradm /usr/local/bin/clusteradm