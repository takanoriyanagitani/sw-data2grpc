import DataProto
import GRPC
import NIOCore

public typealias PushReq = Data_V1_PushRequest
public typealias PushRes = Data_V1_PushResponse
public typealias IDataServiceClient = Data_V1_DataServiceAsyncClientProtocol
public typealias DataServiceClient = Data_V1_DataServiceAsyncClient

public func Push(cli: IDataServiceClient, req: PushReq) async throws -> PushRes {
  try await cli.push(req)
}

public func DataSvcClientNew(chan: GRPC.GRPCChannel) -> DataServiceClient {
  DataServiceClient(channel: chan)
}

public func CreateEvLoopGrp(loopCount: Int) -> any NIOCore.EventLoopGroup {
  GRPC.PlatformSupport.makeEventLoopGroup(loopCount: loopCount)
}

public func ConnBuilderClear(grp: any NIOCore.EventLoopGroup) -> ClientConnection.Builder {
  ClientConnection.insecure(group: grp)
}

public struct ConnInfo {
  private let host: String
  private let port: Int

  public init(host: String, port: Int = 50051) {
    self.host = host
    self.port = port
  }

  public func Connect(bld: ClientConnection.Builder) -> ClientConnection {
    bld.connect(host: self.host, port: self.port)
  }
}
