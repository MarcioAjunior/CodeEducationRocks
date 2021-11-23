FROM golang:1.16-alpine as builder

WORKDIR /

COPY main.go ./
COPY go.mod ./

RUN go mod download
RUN go build -o /exe

FROM scratch

WORKDIR /

COPY --from=builder /exe ./

ENTRYPOINT [ "/exe" ]