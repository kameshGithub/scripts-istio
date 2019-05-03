#!/bin/bash

command1="kubectl scale --replicas=1 deployment/recommendation-v1"
echo $command1
$command1

command2="kubectl scale --replicas=1 deployment/recommendation-v2"
echo $command2
$command2
