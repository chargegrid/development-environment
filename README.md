# Development Environment

This project contains all the stuff necessary to setup your local dev environment so
you can work on the ChargeGrid projects.

## Setup

Install Docker for Mac by [going here](https://docs.docker.com/engine/installation/mac/#/docker-for-mac) 
and following the instructions. This will install:

- Docker engine
- `docker` cli tool
- `docker-compose`
- `docker-machine` (which you won't need unless you want to provision a Docker host 
  on a cloud provider like AWS or Google Compute)

## Run stuff

**Run the whole shebang (without any charge-boxes)**

```
docker-compose up
```

**Run only RabbitMQ, DynamoDb**

```
dc up rmq rmq_exchanges dynamodb -d
```

**Run only the backend-services (and their dependencies), without the Portal**

```
./up-backend.sh
```

**Check status of all services**

```
./check_status_all.sh
```

This requires `httpie` and assumes services are reachable on _localhost_, 
which is the case if you use Docker of Mac)

Installation of httpie:

```
brew install python
pip install httpie
```

**Run the portal**

When you have all the backend services running, but want run the portal outside 
of Docker, you can follow the instructions of the README.md in the _portal_ project.

**Run RabbitMQ + PostgreSQL of services you want to work on**

This is useful when you want to run a backend service outside of Docker, but want 
to run its dependencies in Docker.

```
./work-on.sh [service-names]
```

## Usage

Once all services are running, you can start adding data and exploring the API. [USAGE.md](USAGE.md) 
contains details on how to do this.


## Generate dependency graph from docker-compose.yml

```
brew install graphviz
pip install 
python generate-dc-graph.py
```

Then look for `architecture.pdf` in the project folder
