# Service Template

This is a simple GoLang service template that utilizes Echo. It is meant to serve as the foundation for a variety of microservices.

## Building the Project

To run the project run: 

    go run main.go

## Creating a Docker image 

To run on Docker first build the Docker image: 

    docker build -t service-template .

To specify what version of Go you would like to use with the Docker image:

    docker build --build-arg GO_VERSION=[YOUR_VERSION] -t service-template .

To run the Docker image: 

    docker run -d -p 8888:8888 service-template

## Building and Running with Docker Compose

To build and run the service using Docker Compose, use the following command:

    docker-compose up --build

Once the container is running, you can access the service at:

    http://localhost:8888

To stop the running containers, use the following command:

    docker-compose down

## Compiling on ACT 

We use [ACT](https://github.com/nektos/act) to build the project. Our GitHub Actions' workflow (which is also used locally by ACT) is pretty simple.

To get started, ensure that [ACT is installed](https://nektosact.com/installation/index.html) on your system.

Now that ACT is installed, you can see the workflow run locally by running: 

    act -j build

## Using the Makefile

This Makefile provides another convenient way to build, test, lint, and manage Docker containers for the project.

### Variables

`DOCKER_IMAGE`: The name of the Docker image (default: service-template).
`DOCKER_TAG`: The tag for the Docker image (default: latest).

### Commands

To build and run the Go project locally

    make run

To run all Go tests with verbose output

    make test

To run the linter using golangci-lint to check the code for style and correctness

    make lint

To builda a Docker image using the specified `DOCKER_IMAGE` and `DOCKER_TAG`

    make docker-build

To run Go tests inside a Docker container built from the project.

    make docker-test

To clean up the project by removing the ./bin directory

    make clean

## Contact

If you have any questions or suggestions, feel free to [open a ticket](https://github.com/UCLALibrary/service-template/issues) on project's GitHub repo.
