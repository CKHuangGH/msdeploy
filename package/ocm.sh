#!/bin/bash

clusteradm init --wait --context kind-management0 &
clusteradm init --wait --context kind-management1 &