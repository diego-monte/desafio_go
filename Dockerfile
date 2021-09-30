FROM golang:1.12-alpine AS build_golang

WORKDIR /go/src/desafio

COPY ./src .

RUN CGO_ENABLED=0 go build -o /desafio main.go

FROM scratch

COPY --from=build_golang /desafio /desafio

CMD ["/desafio"]