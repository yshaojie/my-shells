pods=$( kubectl get pods -n $1 | grep  Running | grep "$2" | awk -F " " '{print $1}' )
if [ ${#pods[@]} -gt 1 ]; then
  for pod in $pods;
  do
      echo "kubectl logs -n $1 -f  $pod"
  done
elif [  ${#pods[@]} -eq 1  ]; then
  eval "kubectl logs -n $1 -f  ${pods[0]}"
else
  echo "not found pod=$2,namespace=$1"
fi