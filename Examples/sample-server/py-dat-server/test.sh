#!/bin/sh

protodir=./Protos
protofile="data/v1/dat.proto"
server=127.0.0.1:50051

helo_msg_bytes=$( printf 'helo wrld' | base64 )

timeout_seconds=1.0
keepalive_seconds=60.0
max_bytes=1048576
max_wait_seconds=1.0

which jaq |
	fgrep -q jaq \
	|| exec sh -c 'echo jaq missing. install it using cargo/rust.; exit 1'

jaq \
  -n \
  --arg msg_bytes "${helo_msg_bytes}" \
  -c '{"data": $msg_bytes}' |
  grpcurl \
	-plaintext \
  	-connect-timeout ${timeout_seconds} \
	-keepalive-time ${keepalive_seconds} \
	-max-msg-sz ${max_bytes} \
	-max-time ${max_wait_seconds} \
  	-d @ \
	-import-path "${protodir}" \
	-proto "${protofile}" \
	"${server}" \
	data.v1.DataService/Push
