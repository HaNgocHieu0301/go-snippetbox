FROM golang:latest

# RUN apt-get update && apt-get install -y net-tools
WORKDIR /go/src/app

RUN apt-get update && apt-get install -y default-mysql-client

COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Cài đặt Delve (debugger cho Go)

# RUN go install github.com/go-delve/delve/cmd/dlv@latest

# RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o myapp ./cmd/web

RUN go get github.com/githubnemo/CompileDaemon
RUN go install github.com/githubnemo/CompileDaemon

# The build flag sets how to build after a change has been detected in the source code
# The command flag sets how to run the app after it has been built
ENTRYPOINT CompileDaemon -build="go build -o myapp ./cmd/web" -command="./myapp"

EXPOSE 4000

# Lệnh để khởi động ứng dụng
#CMD ["./myapp"]