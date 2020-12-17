#/bin/bash
git pull origin master
rm ./base/rollout.yml
sed -i '' -e '$ d' base/kustomization.yml 
git status
git add --all
git commit -m "."
git push 
echo "test"
kustomize build overlays
