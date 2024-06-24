FROM golang:1.22 AS build

WORKDIR /usr/src/app

COPY main.go ./
RUN CGO_ENABLED=0 go build main.go

FROM scratch

COPY --from=build /usr/src/app/main ./

CMD ["./main"]