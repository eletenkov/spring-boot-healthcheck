# Health check demo

## Demo

### Package

``` sh
make package
```

### Build docker image

``` sh
make build
```

### Run demo

``` sh
make run
```

### Check status

``` sh

docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                   PORTS                    NAMES
4c0dc36e3f53        demo/demo           "java -Djava.securit…"   2 minutes ago       Up 2 minutes (healthy)   8080/tcp                 jovial_dubinsky
```
