#!/bin/bash

clusteradm init --wait --context kind-management0 &
clusteradm init --wait --context kind-management1 &

kubectl --context=kind-management0 create -f metrics_server.yaml
kubectl --context=kind-management1 create -f metrics_server.yaml
kubectl --context=kind-member0 create -f metrics_server.yaml