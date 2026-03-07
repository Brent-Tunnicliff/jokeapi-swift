// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    public import FoundationEssentials
#else
    public import Foundation
#endif

// MARK: - JokeError

/// Represents an error getting Jokes.
public struct JokeError {
    /// Code defining the type of error.
    public let code: Code

    private let localizedDescription: String
    private let localizedFailureReason: String?
    private let userInfo: [String: String]

    init(
        code: Code,
        localizedDescription: String,
        localizedFailureReason: String? = nil,
        userInfo: [String: String] = [:]
    ) {
        self.code = code
        self.localizedDescription = localizedDescription
        self.localizedFailureReason = localizedFailureReason
        self.userInfo = userInfo
    }
}

extension JokeError {
    /// Default case of the `networkResponseErrorStatus` error.
    public static let networkResponseErrorStatus = JokeError(
        code: .networkResponseErrorStatus,
        localizedDescription: String(localized: .errorNetworkResponseWithErrorStatus)
    )

    /// Default case of the `unexpectedFailure` error.
    public static let unexpectedFailure = JokeError(
        code: .unexpectedFailure,
        localizedDescription: String(localized: .errorDescriptionUnexpectedFailure)
    )

    /// Returns a Boolean value indicating whether the two errors are of the same domain and code.
    public static func ~= (pattern: JokeError, value: any Error) -> Bool {
        guard let value = value as? JokeError else {
            return false
        }

        return pattern.code == value.code
    }
}

// MARK: Codable

extension JokeError: Codable {
    private enum CodingKeys: String, CodingKey {
        case code
        case localizedDescription = "localized_description"
        case userInfo = "user_info"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            code: try container.decode(Code.self, forKey: .code),
            localizedDescription: try container.decode(String.self, forKey: .localizedDescription),
            userInfo: try container.decode([String: String].self, forKey: .userInfo)
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(code, forKey: .code)
        try container.encode(localizedDescription, forKey: .localizedDescription)
        try container.encode(userInfo, forKey: .userInfo)
    }
}

// MARK: CustomDebugStringConvertible

extension JokeError: CustomDebugStringConvertible {
    public var debugDescription: String {
        "\(Self.errorDomain).\(code.debugDescription)"
    }
}

// MARK: CustomNSError

extension JokeError: CustomNSError {
    /// The domain of the error.
    public static let errorDomain: String = "JokeProvider.Error"

    /// The error code within the given domain.
    public var errorCode: Int {
        code.rawValue
    }

    /// The user-info dictionary.
    public var errorUserInfo: [String: Any] {
        userInfo
    }
}

// MARK: CustomStringConvertible

extension JokeError: CustomStringConvertible {
    public var description: String {
        "\(Self.errorDomain) (\(code.description))"
    }
}

// MARK: Hashable

extension JokeError: Hashable {}

// MARK: LocalizedError

extension JokeError: LocalizedError {
    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        localizedDescription
    }

    /// A localized message describing the reason for the failure.
    public var failureReason: String? {
        localizedFailureReason
    }
}

// MARK: Sendable

extension JokeError: Sendable {}
