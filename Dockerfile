FROM golang:1.13 as builder

WORKDIR /app

COPY . .
RUN CGO_ENABLED=0 go build -o main

FROM alpine:3.11
COPY --from=builder /app/main .

ENTRYPOINT ["./main"]
