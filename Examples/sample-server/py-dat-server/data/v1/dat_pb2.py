# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: data/v1/dat.proto
# Protobuf Python Version: 4.25.1
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x11\x64\x61ta/v1/dat.proto\x12\x07\x64\x61ta.v1\"\x1b\n\x0bPushRequest\x12\x0c\n\x04\x64\x61ta\x18\x01 \x01(\x0c\"$\n\x0cPushResponse\x12\x14\n\x0cqueue_length\x18\x01 \x01(\x05\x32\x42\n\x0b\x44\x61taService\x12\x33\n\x04Push\x12\x14.data.v1.PushRequest\x1a\x15.data.v1.PushResponseb\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'data.v1.dat_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  DESCRIPTOR._options = None
  _globals['_PUSHREQUEST']._serialized_start=30
  _globals['_PUSHREQUEST']._serialized_end=57
  _globals['_PUSHRESPONSE']._serialized_start=59
  _globals['_PUSHRESPONSE']._serialized_end=95
  _globals['_DATASERVICE']._serialized_start=97
  _globals['_DATASERVICE']._serialized_end=163
# @@protoc_insertion_point(module_scope)
