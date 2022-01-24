FROM golang:latest AS builder

WORKDIR /usr/src/app

COPY files .

RUN go build main.go

FROM scratch

COPY --from=builder /usr/src/app/main /

CMD ["./main"]