## Updates and cleanup

brew update
brew upgrade

pip install --upgrade pip

nvm install 'lts/*'
onn
avn setup


## Cleanup

docker system prune --all
docker volume prune

yarn cache clean
npm cache clean --force

vboxmanage modifymedium disk "/Users/xxx/VirtualBox VMs/Ubuntu 16 C/Ubuntu 16 C-disk1.vdi" --compact



### Cleanup git repo:

git remote prune origin
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
git gc
