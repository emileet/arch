# emileet/arch

the arch experience in a container

## instructions

clone this repo and then build an image

```shell
cd arch
docker build --tag emileet/arch --build-arg username=emileet .
```

now spin up a container
```shell
docker run -ti --name arch emileet/arch
```