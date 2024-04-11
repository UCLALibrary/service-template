# Hello World

This is a simple Hello World go program that utilizes Gin. It is meant to help us, the Services team, learn about building a Go program that uses best practices we 
will have during development of larger programs

## Building the Project

To run the project run: 

`go run main.go`

## Creating a Docker image 

To run on Docker first build the Docker image: 

`docker build -t service-template .`

To specify what version of Go you would like to use with the Docker image:

`docker build --build-arg GO_VERSION=[YOUR_VERSION] -t service-template .`

To run the Docker image: 

`docker run -d -p 8888:8888 service-template`

## Compiling on ACT 

At the moment, the GA workflow is simple. Since we are listening for http requests, the workflow will not terminate until explicitly told to do so. The workflow will 
be updated as the application changes.

To get started, ensure that [ACT is installed](https://nektosact.com/installation/index.html) on your system.

Now that ACT is installed you can see the workflow run locally by running: 

`act -j build` 
