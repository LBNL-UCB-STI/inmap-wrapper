FROM golang:1.12 AS build-stage
WORKDIR /app
RUN git clone --branch v1.6.1 --depth 1 https://github.com/spatialmodel/inmap.git
WORKDIR /app/inmap
RUN go install ./...
RUN GO111MODULE=on CGO_ENABLED=0 GOOS=linux go build -o /inmap
RUN chmod +x /inmap
# Deploy the application binary into a lean image
FROM golang:1.12 AS build-release-stage
WORKDIR /
COPY --from=build-stage /inmap /inmap
EXPOSE 7171
USER nonroot:nonroot
ENTRYPOINT ["/inmap"]
