# we are using golang image to build our application
FROM golang:1.22 AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod
COPY . .

# Download all dependencies. Dependencies will be cached if the go.mod is not changed
RUN go mod download

# Build the Go app
RUN go build -o main .

# Start a new stage from scratch
FROM gcr.io/distroless/base

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/main .

# Copy the static files
COPY --from=builder /app/static /static

# expose the port on which the application will run
EXPOSE 8080

# Command to run the executable
CMD ["./main"]