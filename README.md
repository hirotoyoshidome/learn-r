# learn-r

## docker

```
docker build -t myr .
docker run --rm -it -d -v $(pwd):/usr/src --name myr myr:latest
docker exec -it myr bash
```

### exec

```
Rscript index.R
```

### console

```
R --version
R
```
