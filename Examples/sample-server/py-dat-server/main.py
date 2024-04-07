from concurrent import futures

import grpc

from data.v1.dat_pb2 import PushRequest, PushResponse

from data.v1.dat_pb2_grpc import DataServiceStub
from data.v1.dat_pb2_grpc import DataService
from data.v1.dat_pb2_grpc import DataServiceServicer
from data.v1.dat_pb2_grpc import add_DataServiceServicer_to_server

class DatSvc(DataServiceServicer):
	def Push(self, request: PushRequest, context):
		print("request got.")
		dat: bytes = request.data
		datlen: int = len(dat)
		print(f"data length: {datlen}")
		response: PushResponse = PushResponse()
		response.queue_length = datlen
		return response
	pass

def start(workers: int, listen: str):
	server = grpc.server(futures.ThreadPoolExecutor(max_workers=workers))
	add_DataServiceServicer_to_server(DatSvc(), server)
	server.add_insecure_port(listen)
	server.start()
	server.wait_for_termination()

start(10, "127.0.0.1:50051")
