FROM golang:1.15.8-buster AS builder
WORKDIR /usr/local
RUN go get -d github.com/lddsb/replace-env && go build -o replace-env ${GOPATH}/src/github.com/lddsb/replace-env/

FROM alpine:latest

COPY --from=builder /usr/local/replace-env /bin
RUN chmod +x /bin/replace-env

CMD ["/bin/sh"]
