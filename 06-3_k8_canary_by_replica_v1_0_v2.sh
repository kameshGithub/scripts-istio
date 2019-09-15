#!/bin/bash
#0-100%
command1="kubectl scale --replicas=0 deployment/recommendation-v1"
echo $command1
$command1
