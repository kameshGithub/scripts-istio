#!/bin/bash
step=0

canary[1]="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1_and_v2_90_10.yml -n $NAMESPACE"
canary[2]="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1_and_v2_75_25.yml -n $NAMESPACE"
canary[3]="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1_and_v2_25_75.yml -n $NAMESPACE"
canary[4]="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1_and_v2_10_90.yml -n $NAMESPACE"
canary[5]="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v2.yml -n $NAMESPACE"

canarySize[1]="10%"
canarySize[2]="25%"
canarySize[3]="75%"
canarySize[4]="90%"
canarySize[5]="100%"

echo "Canary Rollout...."
while [ $step -lt 5 ]
do
   read -r -p "Do you want to increase the canary size of v2 to ${canarySize[$step+1]} ? [Y/n]: " input 
   
   case $input in
      [yY][eE][sS]|[yY])
         step=`expr $step + 1`
         command=${canary[step]}
         # echo "Increaseing to : " $command
          $command
          sleep 1s
   ;;
      [nN][oO]|[nN])
         command=${canary[step]}
         echo "Keeping existing canary size : ${canarySize[$step]} "
   ;;
      *)
         echo "Invalid input..."
   ;;
   esac
   
   if [ $step = 5 ]
   then
      echo "All traffic SUCCESSFULLY shifted to v2"
   fi
done
