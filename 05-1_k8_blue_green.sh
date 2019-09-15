#!/bin/bash

str1='{"spec":{"selector":{"app":"recommendation","version":"v1"}}}'
str2='{"spec":{"selector":{"app":"recommendation","version":"v2"}}}'

V1="kubectl patch service/recommendation -p $str1 -n $NAMESPACE"
V2="kubectl patch service/recommendation -p $str2 -n $NAMESPACE"
delete="kubectl delete svc recommendation -n $NAMESPACE"
create="kubectl apply -f ../istio-tutorial/recommendation/kubernetes/Service.yml -n $NAMESPACE"

input="n"
while [ $input != "e" ]
do
   read -r -p "Which version do you want to switch to  ? [v1/v2, both OR exit]: " input 
   
   case $input in
      [vV][1])
         command=$V1
         echo $command
         $command
   ;;
      [vV][2])
         command=$V2
         echo $command
         $command
   ;;
      [bB][oO][tT][hH])
         command=$delete
         $command
         command=$create
         $command
   ;;
      *)
         echo "Exiting Blue/Green Deployment..."
   ;;
   esac
done
