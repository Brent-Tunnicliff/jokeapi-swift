//// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>
//
//#if canImport(FoundationEssentials)
//    public import FoundationEssentials
//#else
//    public import Foundation
//#endif
//
///// Represents an error returned by JokeAPI.
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
