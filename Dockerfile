FROM golang:latest

# RUN apt-get update && apt-get install -y net-tools
WORKDIR /go/src/app

RUN apt-get update && apt-get install -y default-mysql-client

COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Cài đặt Delve (debugger cho Go)

# RUN go install github.com/go-delve/delve/cmd/dlv@latest

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o myapp ./cmd/web

EXPOSE 4000

# Lệnh để khởi động ứng dụng
CMD ["./myapp"]