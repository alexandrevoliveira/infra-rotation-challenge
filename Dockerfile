FROM golang:1.17-bullseye AS build
WORKDIR /go/src/app
ADD . /go/src/app
RUN go mod init
RUN go get -d -v golang.org/x/net/html
RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/app

# Now copy it into our base image.
FROM alpine
COPY --from=build /go/bin/app /
COPY --from=build /go/src/app/static /static
CMD ["/app"]
