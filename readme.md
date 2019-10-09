#### Docker PSYSH

Docker container with [psysh](https://psysh.org/) ready to help the php developers to test codes quickly.

#### Techonologies

* Alpine 3.10
* PHP 7.3
* psysh

#### Instalation

**By docker pull**

```terminal
docker pull c0dehappy/psysh
```

**Or git clone the repository**

```terminal
git clone https://github.com/c0dehappy/docker-psysh.git
```

####  Docker Image

Create a docker image.

```terminal
docker build -t psysh .
```

#### Usage

Run the image to enter in terminal:

```terminal
$ docker run -ti psysh
Psy Shell v0.9.9 (PHP 7.3.10 — cli) by Justin Hileman
>>> echo 'Hello world';
Hello world⏎
>>>
```

Easy to code!!
