// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - JokeType

extension JokeAPIRequest {
    /// The structure type of the Joke.
    public struct JokeType {
        let value: Value
    }
}

extension JokeAPIRequest.JokeType {
    /// Single part jokes.
    public static let any = JokeAPIRequest.JokeType(value: .any)

    /// Single part jokes.
    public static let single = JokeAPIRequest.JokeType(value: .single)

    /// Two part jokes containing setup and delivery.
    public static let twoPart = JokeAPIRequest.JokeType(value: .twoPart)
}

// MARK: CaseIterable

extension JokeAPIRequest.JokeType: CaseIterable {
    public static let allCases = JokeAPIRequest.JokeType.Value.allCases.map(JokeAPIRequest.JokeType.init(value:))
}

// MARK: Codable

extension JokeAPIRequest.JokeType: Codable {}

// MARK: Hashable

extension JokeAPIRequest.JokeType: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.JokeType: Sendable {}

// MARK: - Value

extension JokeAPIRequest.JokeType {
    // Keeping enum internal to protect consumers from breaking changes.
    enum Value {
        case any
        case single
        case twoPart
    }
}

// MARK: CaseIterable

extension JokeAPIRequest.JokeType.Value: CaseIterable {}

// MARK: Codable

extension JokeAPIRequest.JokeType.Value: Codable {}

// MARK: Hashable

extension JokeAPIRequest.JokeType.Value: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.JokeType.Value: Sendable {}
