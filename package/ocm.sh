#!/bin/bash

# Deploy Prometheus Federation on Cluster 0
kubectl config use-context kind-management0

clusteradm init --wait --context kind-management0