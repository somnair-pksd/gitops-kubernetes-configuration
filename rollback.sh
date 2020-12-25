#/bin/bash
git pull origin master
k delete -f ./base/rollout.yml
rm ./base/rollout.yml
sed -i '' -e '$ d' base/kustomization.yml 
sed -i -e '$a- service.yml' ./base/kustomization.yml
git status
git add --all
git commit -m "."
git push 
k argo rollouts get rollout simple-deployment -n dev-som
echo "test"
kustomize build overlays

