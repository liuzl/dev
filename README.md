# dev

```sh
docker build -t ubuntu:dev.16.04 .
```

```sh
docker run -d --name dev-ubuntu -p 36000:36000 -v /Users/zliu/dev:/home/zliu ubuntu:dev.16.04
```

```sh
ssh -p 36000 zliu@127.0.0.1 
```
