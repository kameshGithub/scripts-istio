#!/bin/bash

minikube start -p $NAMESPACE --memory=8192 --cpus=4 \
  --vm-driver=virtualbox \
  --disk-size=30g \
