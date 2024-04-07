#!/bin/sh

gendir=./.build/release
export PATH="${gendir}:${PATH}"

which protoc-gen-swift || exec sh -c 'echo protoc-gen-swift not found.; exit 1'
which protoc-gen-grpc-swift || exec sh -c 'echo protoc-gen-grpc-swift not found.; exit 1'

protoc \
  --plugin=$( which protoc-gen-swift ) \
  --proto_path=Protos/data/v1 \
  --swift_out=./Sources/DataProto/V1 \
  --swift_opt=Visibility=Public \
  Protos/data/v1/dat.proto

protoc \
  --plugin=$( which protoc-gen-grpc-swift ) \
  --proto_path=Protos/data/v1 \
  --grpc-swift_out=./Sources/DataProto/V1 \
  --grpc-swift_opt=Visibility=Public \
  Protos/data/v1/dat.proto
