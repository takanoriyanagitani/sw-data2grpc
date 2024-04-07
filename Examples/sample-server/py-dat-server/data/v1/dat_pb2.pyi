from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Optional as _Optional

DESCRIPTOR: _descriptor.FileDescriptor

class PushRequest(_message.Message):
    __slots__ = ("data",)
    DATA_FIELD_NUMBER: _ClassVar[int]
    data: bytes
    def __init__(self, data: _Optional[bytes] = ...) -> None: ...

class PushResponse(_message.Message):
    __slots__ = ("queue_length",)
    QUEUE_LENGTH_FIELD_NUMBER: _ClassVar[int]
    queue_length: int
    def __init__(self, queue_length: _Optional[int] = ...) -> None: ...
