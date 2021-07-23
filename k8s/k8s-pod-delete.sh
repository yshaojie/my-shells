pods=$( kubectl get pods -n $1 | grep "$2" | awk -F " " '{print $1}' )
for pod in $pods;
do
    echo "kubectl delete pod $pod  -n $1 --force"
    eval "kubectl delete pod $pod  -n $1 --force"
done