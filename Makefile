.PHONY: help all

help:

all: api/siam.pg.go

PROTOC:=protoc

api/siam.pg.go: api/siam.proto
	$(PROTOC) \
	  --go_out=:. --go_opt=paths=source_relative \
	  --go-grpc_out=. --go-grpc_opt=paths=source_relative \
		$^

#	$(PROTOC) \
	  -I. -IC:\opt\protoc\include -I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
	  --go_out=plugins=grpc:. --go_opt=paths=source_relative \
	  --go-grpc_out=. --go-grpc_opt=paths=source_relative \
		--grpc-gateway_out=. --grpc-gateway_opt=paths=source_relative \
		$^
