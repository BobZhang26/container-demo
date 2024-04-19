# This is the containerization demo

## Environment setup

- Install [Docker](https://www.docker.com/get-started/)

## steps to build and run the container

!!! VERY IMPORTANT !!!
activate python virtual environment for the project
in the project directory, run
```bash
python3 -m venv ./venv
source ./venv/bin/activate
```

* 1. create a project directory and navigate to the directory
```bash
mkdir containerization-demo
cd containerization-demo
```

- 2. create a Dockerfile and edit contents
```bash
touch Dockerfile
```
see details in `Dockerfile`

- 3. create a simple python script in `main.py` inside the project directory `app`
```bash
mkdir app
touch app/main.py
```
see details in `app/main.py`

- 4. test the python script locally
```bash
uvicorn main:app --reload
```
It should open a web page displaying "Hello, BODES" message. Therefore, the app is running successfully on the local machine. The next step is to containerize the app.

- 5. build the container image
```bash
docker build -t fastapi .
```
This command will build the container image with the name `fastapi` based on the Dockerfile in the project directory.

- 6. run the container image
```bash
docker run -p 8000:80 fastapi
```
This command will run the container image `fastapi` and map the port 80 inside the container to the port 8000 on the local machine. Therefore, the app can be accessed by visiting `http://localhost:8000` in the browser. Why port 80? Because the FastAPI app is running on port 80 inside the container. Why port 8000? Because we mapped the port 80 inside the container to the port 8000 on the local machine, and local machine has default 127.0.0.1 IP address.

- 7. push the container image to a container registry such as Docker Hub, Azure Container Registry, Google Container Registry, Amazon Elastic Container Registry, etc. In this demo, we will use Docker Hub, but later we will use Azure Container Registry in the CI/CD pipeline.
```bash
docker login
docker tag fastapi <docker-hub-username>/fastapi
docker push <docker-hub-username>/fastapi
```
This command will push the container image to Docker Hub.
Check the image on Docker Hub: https://hub.docker.com/repository/docker/bodesz/fastapi



After successfully tested the container image running on local machine, our next step is to push this image to a container registry. There are many registries available such as Docker Hub, Azure Container Registry, Google Container Registry, Amazon Elastic Container Registry, etc. In this demo, we will use Docker Hub.
