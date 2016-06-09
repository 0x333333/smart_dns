Smart DNS
=========

Hosted by Docker.

```sh
# build
docker build -t smart_dns .

# run
docker run -p 53:53/udp -it smart_dns
```
