// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - JokeError.Code

extension JokeError {
    public struct Code {
        let value: Value
    }
}

extension JokeError.Code {
    public static let networkResponseErrorStatus: JokeError.Code = .init(value: .networkResponseErrorStatus)
    public static let unexpectedFailure: JokeError.Code = .init(value: .unexpectedFailure)
}

// MARK: CaseIterable

extension JokeError.Code: CaseIterable {
    public static let allCases: [JokeError.Code] = JokeError.Code.Value.allCases
        .map(JokeError.Code.init(value:))
}

// MARK: Codable

extension JokeError.Code: Codable {}

// MARK: CustomDebugStringConvertible

extension JokeError.Code: CustomDebugStringConvertible {
    public var debugDescription: String {
        "\(value)"
    }
}

// MARK: CustomStringConvertible

extension JokeError.Code: CustomStringConvertible {
    public var description: String {
        rawValue.description
    }
}

// MARK: Hashable

extension JokeError.Code: Hashable {}

// MARK: RawRepresentable

extension JokeError.Code: RawRepresentable {
    public init?(rawValue: Int) {
        guard let inner = Value(rawValue: rawValue) else {
            return nil
        }

        self.init(value: inner)
    }

    public var rawValue: Int {
        value.rawValue
    }
}

// MARK: Sendable

extension JokeError.Code: Sendable {}

// MARK: - JokeError.Code.Value

extension JokeError.Code {
    enum Value: Int {
        case unexpectedFailure = -1001
        case networkResponseErrorStatus = -1002
    }
}

// MARK: CaseIterable

extension JokeError.Code.Value: CaseIterable {}

// MARK: Codable

extension JokeError.Code.Value: Codable {}

// MARK: Hashable

extension JokeError.Code.Value: Hashable {}

// MARK: Sendable

extension JokeError.Code.Value: Sendable {}
