#!/bin/bash

# Instead of failing immediately, retry the Service N more times
# We will make pod recommendation-v2 fail 100% of the time. Get one of the pod names 
# from your system and replace on the following command accordingly:

# You will be inside the application container of your pod recommendation. 
# This is a special endpoint that will make our application return only `503`s.
# You will see it works every time because Istio will retry the recommendation 
# service automatically and it will land on v1 only

kubectl exec -it -n $NAMESPACE $(kubectl get pods -n $NAMESPACE|grep recommendation-v2|awk '{ print $1 }'|head -1) -c recommendation /bin/bash

curl localhost:8080/misbehave
exit
