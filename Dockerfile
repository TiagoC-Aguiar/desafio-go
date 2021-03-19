FROM golang:1.16 AS builder

WORKDIR /go/src/
COPY . .
RUN GOOS=linux go build fullcycle.go


FROM scratch
COPY --from=builder /go/src/fullcycle .

CMD ["./fullcycle"]

