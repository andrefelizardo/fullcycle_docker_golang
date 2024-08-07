FROM golang:1.22-alpine as builder

WORKDIR /usr/src/app

COPY go.mod ./
RUN go mod download

COPY ./app .
RUN go build -v -o app

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/app .

CMD ["./app"]

