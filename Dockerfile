ARG GO_VERSION=1.22.1
ARG ALPINE_VERSION=3.19

# Use the official Go image as the base image for the build stage
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS build

LABEL org.opencontainers.image.source="https://github.com/uclalibrary/service-template"
LABEL org.opencontainers.image.description="A template for UCLA Library services written in Go"

# Set the working directory inside the container
WORKDIR /app

# Copy the local package files to the container
COPY . .

# Compile application
RUN go build -o /service

##
## STEP 2 - DEPLOY
##
FROM alpine:${ALPINE_VERSION}

WORKDIR /

# Copy the executable from the build stage
COPY --from=build /service /service

# Expose the port on which the application will run
EXPOSE 8888

# Specify the command to be used when the image is used to start a container
ENTRYPOINT [ "/service" ]
