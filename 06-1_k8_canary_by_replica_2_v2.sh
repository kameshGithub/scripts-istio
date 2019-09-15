#!/bin/bash
# 33%-66%
# Remove the istio object virtual service and destination rule
./12-clean_vs_dr.sh

command1="kubectl scale --replicas=2 deployment/recommendation-v2"
echo $command1
$command1
