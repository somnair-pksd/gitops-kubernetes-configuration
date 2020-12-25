#/bin/bash
git pull origin master
k delete -f ./base/rollout.yml
rm ./base/rollout.yml
mv ./base/kustomization.yml.orig ./base/kustomization.yml
git status
git add --all
git commit -m "."
git push 
kubectl argo rollouts get rollout simple-deployment -n dev-som
echo "test"
kustomize build overlays

