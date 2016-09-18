## Virtualized Open Source Development Environment

...


http://www.offirmo.net/virtualized-open-source-dev-env/hello.sh

```
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/hello.sh | bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/hello.sh | sudo bash

curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/install_root.sh | sudo bash
curl -o- http://www.offirmo.net/virtualized-open-source-dev-env/install_nonroot.sh | bash
```


ssh sam@192.168.88.10

ssh-keygen -t rsa -b 4096 -C "offirmo.net@gmail.com"
cat ~/.ssh/id_rsa.pub 

## https://confluence.jetbrains.com/display/IDEADEV/JetBrains+Runtime+Environment
## https://bintray.com/jetbrains/intellij-jdk/openjdk8-linux-x64
curl -L "https://dl.bintray.com/jetbrains/intellij-jdk/jbsdk8u112b340_linux_x64.tar.gz" -o ~/work/install/jbsdk8u112b340_linux_x64.tar.gz
cd ~/work/install/; mkdir jbsdk8u112b340_linux_x64; tar -xzf jbsdk8u112b340_linux_x64.tar.gz -C jbsdk8u112b340_linux_x64


cd ~/work/src && git clone git@github.com:Offirmo/virtualized-open-source-dev-env.git


