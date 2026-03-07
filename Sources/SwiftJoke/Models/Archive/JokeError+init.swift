// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

//import Foundation

//extension JokeError {
//    init(data: Data, response: URLResponse) {
//        do {
//            let decoder = JSONDecoder()
//            let response = try decoder.decode(Response.self, from: data)
//        } catch {
//
//        }
//
////        self.init(
////            code: Code,
////            localizedDescription: String,
////            localizedFailureReason: String? = nil,
////            userInfo: [String: String] = [:]
////        )
//    }
//
//    private init(response: URLResponse) {
//
//    }
//
//
////    {
////        "error": true,
////        "internalError": false,
////        "code": 106,
////        "message": "No matching joke found",
////        "causedBy": [
////            "No jokes were found that match your provided filter(s)"
////        ],
////        "additionalInfo": "The specified category is invalid - Got: \"foo\" - Possible categories are: \"Any, Misc, Programming, Dark, Pun, Spooky, Christmas\" (case insensitive)",
////        "timestamp": 1579170794412
////    }
//
//    private struct Response: Codable, Error, Hashable, Sendable {
//        let additionalInfo: String
//        let causedBy: [String]
//        let message: String
//        let statusCode: Int
//        let timestamp: Date
//    }
//}

//public struct JokeError: Codable, Error, Hashable, Sendable {
//    /// Descriptive error message.
//    public let additionalInfo: String
//
//    /// Possible causes of this error.
//    public let causedBy: [String]
//
//    /// Short version of the error message.
//    public let message: String
//
//    /// Response status code.
//    public let statusCode: Int
//
//    /// 13-character Unix timestamp.
//    ///
//    /// Seconds since 1970, storing as Int because we need Foundation to handle dates.
//    public let timestamp: Date
//}
