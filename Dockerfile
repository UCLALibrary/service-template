ARG GO_VERSION=1.20

# Use the official Go image as the base image for the build stage
FROM golang:${GO_VERSION}-alpine AS build

LABEL org.opencontainers.image.source="https://github.com/uclalibrary/service-template"
LABEL org.opencontainers.image.description="A template for UCLA Library services written in Go"

# Set the working directory inside the container
WORKDIR /app

# Copy the local package files to the container
COPY . .

# Compile application
RUN go build -o /godocker

##
## STEP 2 - DEPLOY
##
FROM scratch

WORKDIR /

# Copy the executable from the build stage
COPY --from=build /godocker /godocker

# Expose the port on which the application will run
EXPOSE 8080

# Specify the command to be used when the image is used to start a container
ENTRYPOINT ["/godocker"]
