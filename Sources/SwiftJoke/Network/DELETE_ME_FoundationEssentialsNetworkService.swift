//// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>
//
//// We only need this file if we cannot use `Foundation`.
//#if canImport(FoundationEssentials)
//    import AsyncHTTPClient
//    import FoundationEssentials
//    import HTTPTypes
//    import NIOCore
//    import NIOFoundationCompat
//    import NIOHTTP1
//    import NIOHTTPTypesHTTP1
//
//    final class FoundationEssentialsNetworkService: NetworkService {
//        static let shared = FoundationEssentialsNetworkService(client: .shared)
//
//        private let client: HTTPClient
//
//        init(client: HTTPClient) {
//            self.client = client
//        }
//
//        func data(for request: HTTPRequest) async throws -> (data: Data, response: HTTPResponse) {
//            let request = try request.asHTTPClientRequest
//            let response = try await client.execute(request, timeout: .seconds(30))
//            let httpResponse = try response.asHTTPType
//            var data = Data()
//            for try await byteBuffer in response.body {
//                let readableBytes = byteBuffer.readableBytes
//                data = byteBuffer.getData(at: byteBuffer.readerIndex, length: readableBytes) ?? Data()
//            }
//
//            return (data, httpResponse)
//        }
//    }
//
//    extension HTTPClientResponse {
//        var asHTTPType: HTTPResponse {
//            get throws {
//                try HTTPResponse(
//                    HTTPResponseHead(
//                        version: version,
//                        status: status,
//                        headers: headers)
//                )
//            }
//        }
//    }
//
//    extension HTTPRequest {
//        fileprivate var asHTTPClientRequest: HTTPClientRequest {
//            get throws {
//                guard let url else {
//                    throw FoundationEssentialsNetworkService.Error.requestUrlIsNil(self)
//                }
//
//                var request = HTTPClientRequest(url: url.absoluteString)
//                request.headers = HTTPHeaders(headerFields)
//                request.method = HTTPMethod(method)
//                return request
//            }
//        }
//    }
//
//    extension FoundationEssentialsNetworkService {
//        enum Error: Swift.Error {
//            case requestUrlIsNil(HTTPRequest)
//        }
//    }
//#endif
