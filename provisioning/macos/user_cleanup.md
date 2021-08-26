## Updates and cleanup

See:
bin/user_clean.sh
bin/user_update.sh


### Cleanup git repo:

git remote prune origin
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
git gc
