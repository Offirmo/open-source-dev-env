
https://github.com/whohas/whohas


installed brew packages
```bash
## all, sorted by size
## https://gist.github.com/eguven/23d8c9fc78856bd20f65f8bcf03e691b
du -sch $(brew --cellar)/*/* | sed "s|$(brew --cellar)/\([^/]*\)/.*|\1|" | sort -k1h
```


TODO review https://github.com/omlahore/RemoveMacAI
