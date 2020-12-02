# emileet/arch
[![pipeline status](https://git.plsnobully.me/emileet/arch/badges/master/pipeline.svg)](https://git.plsnobully.me/emileet/arch/-/commits/master)

the arch experience in a container (intended as a build/packaging environment)

## instructions

clone this repo and then build an image

```shell
cd arch
docker build --tag emileet/arch --build-arg username=emileet .
```

alternatively, pull the image from the pod.plsnobully.me container registry

```shell
docker pull pod.plsnobully.me/emileet/arch:latest
```

now spin up a container
```shell
docker run -ti --rm --name arch emileet/arch
```