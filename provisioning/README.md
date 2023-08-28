
- the scripts should strive to be self-contained, since they can be called remotely
- the 0## scripts are the bootstrap to run remotely. After that, the other should be run locally

- 000 = bootstrap until downloaded this repo
- 100 = base install post-bootstrap, from local
- 200 = ordinary most necessary tools
- 300 = dev env
- 400 = creator
- 900 = gaming


TODO IMPROVE adding to bash_profiles* only if the line is not already here

HOWTO:
```bash
if [ ! command -v brew > /dev/null]; then
	...
fi


```
