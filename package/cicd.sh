#!/bin/bash

rm -rf /usr/local/bin/clusteradm

rm -rf clusteradm_mcsupport/

git clone https://github.com/CKHuangGH/clusteradm_mcsupport.git
chmod 777 clusteradm_mcsupport/
cd clusteradm_mcsupport/
make build

cp /root/go/bin/clusteradm /usr/local/bin/clusteradm