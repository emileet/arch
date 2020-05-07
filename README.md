# emileet/arch

the arch experience in a docker container

## instructions

clone this repo then build a docker image (optionally configure `Dockerfile` to your needs)

```shell
cd arch
docker build --tag emileet/arch .
```

now spin up a container (optionally configure `start.sh` to your needs)
```shell
sh start.sh arcx
```