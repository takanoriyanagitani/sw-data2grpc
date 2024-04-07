#!/bin/sh

protodir="./Protos"
protofile="${protodir}/data/v1/dat.proto"
pyoutdir="."

python3 \
	-m grpc_tools.protoc \
	-I"${protodir}" \
	--python_out="${pyoutdir}" \
	--pyi_out="${pyoutdir}" \
	--grpc_python_out="${pyoutdir}" \
	"${protofile}"
