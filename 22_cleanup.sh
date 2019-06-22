#!/bin/bash
kubectl delete gateway --all
kubectl delete virtualservice --all
kubectl delete destinationrule --all
kubectl delete policy --all
