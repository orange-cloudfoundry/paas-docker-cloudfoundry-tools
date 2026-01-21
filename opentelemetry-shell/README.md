Container for running Open Telemetry shell.

It includes all the dependencies of the :

* git
* otel
* python3

## Build locally

```
$ cd opentelemetry-shell
$ docker build -t opentelemetry-shell .
```

## Run

```
docker run -i -t opentelemetry-shell otel version
```
