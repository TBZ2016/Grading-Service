# Dockerfile

# Use the official Golang image as the base image
FROM golang:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to the working directory
COPY go.mod .
COPY go.sum .

# Download and install Go module dependencies
RUN go mod download

# Copy the rest of the application code to the working directory
COPY . .

# Build the Go application
RUN go build -o grading-service ./cmd/grading-service

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
CMD ["./grading-service"]