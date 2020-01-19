FROM golang:1.13 as builder
ENV GOOS linux
ENV GOARCH arm

WORKDIR /app

COPY . .
RUN CGO_ENABLED=0 go build -o main

FROM arm32v7/alpine:3.11
COPY --from=builder /app/main .

ENTRYPOINT ["./main"]
