import Data2gRPC
import Foundation
import GRPC
import NIOCore

@main
struct ClientSample {
  static func main() async {
    await ClientSample.sub()
  }

  static func sub() async {
    let ci: ConnInfo = Data2gRPC.ConnInfo(
      host: "127.0.0.1",
      port: 50051
    )

    let elgrp: NIOCore.EventLoopGroup = Data2gRPC.CreateEvLoopGrp(loopCount: 3)
    let bldr: GRPC.ClientConnection.Builder = Data2gRPC.ConnBuilderClear(
      grp: elgrp
    )

    let ch: GRPC.ClientConnection = ci.Connect(bld: bldr)
    let cli: Data2gRPC.DataServiceClient = Data2gRPC.DataSvcClientNew(
      chan: ch
    )

    var req: Data2gRPC.PushReq = Data2gRPC.PushReq()
    let dat: Foundation.Data =
      Data(
        base64Encoded: "aGVsbG8sIHdvcmxk" // hello, world
      ) ?? Foundation.Data()
    req.data = dat

    let res: Data2gRPC.PushRes = try! await Data2gRPC.Push(
      cli: cli,
      req: req
    )
    let qlen: Int32 = res.queueLength
    print("queue length: \( qlen )")
  }
}
