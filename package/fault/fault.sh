#!/bin/bash

rm -rf fault-detection-system-mmc/

git clone https://github.com/CKHuangGH/fault-detection-system-mmc.git
chmod 777 fault-detection-system-mmc/
docker build -t chuangtw/faultdetection .
docker login
docker push chuangtw/faultdetection