Image for running Oracle Database 12cr2 Standard/Enterprise. Due to oracle license restrictions image is not contain database itself and will install it on first run from external directory.

``This image for development use only``

# Usage
Download database installation files from [Oracle site](http://www.oracle.com/technetwork/database/in-memory/downloads/index.html) and unpack them to **install_folder**.
Run container and it will install oracle and create database:

```sh
docker run --privileged --name oracle11g -p 1521:1521 -v <install_folder>:/install --hostname oracle12c desai/oracle-12c
```
Then you can commit this container to have installed and configured oracle database:
```sh
docker commit oracle12c oracle12c
```

Database located in **/opt/oracle** folder

OS users:
* root/install
* oracle/install

DB users:
* SYS/password

Optionally you can map dpdump folder to easy upload dumps:
```sh
docker run --privileged --name oracle12c -p 1521:1521 -v <install_folder>:/install -v <local_dpdump>:/opt/oracle/dpdump --hostname oracle12c desai/oracle-12c
```
To execute impdp/expdp just use docker exec command:
```sh
docker exec -it oracle11g impdp ..
```
