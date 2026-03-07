// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>

/// Status code returned in the network response.
//public struct Status {
//    /// Raw value of the status code.
//    public var code: Int {
//        inner.code
//    }
//
//    /// The reason phrase.
//    public var reasonPhrase: String {
//        inner.reasonPhrase
//    }
//
//    let inner: HTTPResponse.Status
//
//    init(_ status: HTTPResponse.Status) {
//        self.inner = status
//    }
//
//    /// Create an instance of ``Status``.
//    public init(code: Int, reasonPhrase: String) {
//        self.inner = HTTPResponse.Status(code: code, reasonPhrase: reasonPhrase)
//    }
//}
//
//extension Status: Codable {
//    private enum CodingKeys: String, CodingKey {
//        case code
//        case reasonPhrase
//    }
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    /// - Throws: An error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
//    public init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.init(
//            code: try container.decode(Int.self, forKey: .code),
//            reasonPhrase: try container.decode(String.self, forKey: .code)
//        )
//    }
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    /// - Throws: An error if any values are invalid for the given encoder's format.
//    public func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(code, forKey: .code)
//        try container.encode(reasonPhrase, forKey: .reasonPhrase)
//    }
//}
//
//extension Status: CustomStringConvertible {
//    /// A textual representation of this instance.
//    public var description: String {
//        "\(code) \(reasonPhrase)"
//    }
//}
//
//extension Status: Hashable {}
//extension Status: Sendable {}
//
//extension Status {
//    /// The request you have sent to JokeAPI is formatted incorrectly and cannot be processed.
//    public static let badRequest = Status(.badRequest)
//
//    /// You have been added to the blacklist due to malicious behavior
//    /// and are not allowed to send requests to JokeAPI anymore.
//    public static let forbidden = Status(.forbidden)
//
//    /// The URL you have requested couldn't be found.
//    public static let notFound = Status(.notFound)
//
//    /// The payload data sent to the server exceeds the maximum size of 5120 bytes.
//    public static let payloadTooLarge = Status(.contentTooLarge)
//
//    /// The URL exceeds the maximum length of 250 characters.
//    public static let uriTooLong = Status(.uriTooLong)
//
//    /// You have exceeded the limit of 120 requests per minute
//    /// and have to wait a bit until you are allowed to send requests again.
//    public static let tooManyRequests = Status(.tooManyRequests)
//
//    /// There was a general internal error within JokeAPI.
//    ///
//    /// You can get more info from the properties in the response text.
//    public static let internalServerError = Status(.internalServerError)
//
//    /// My server is temporarily offline due to maintenance or an outage.
//    ///
//    /// Please be patient and check the status page.
//    public static let originUnreachable = Status(
//        code: 523,
//        reasonPhrase: "Server is temporarily offline due to maintenance or an outage."
//    )
//}
//
//extension Status {
//    /// Is status code a client error.
//    ///
//    /// Value is 4xx.
//    public var isClientError: Bool {
//        inner.kind == .clientError
//    }
//
//    /// Is status code a server error.
//    ///
//    /// Value is 5xx.
//    public var isServerError: Bool {
//        inner.kind == .serverError
//    }
//}
