// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - JokeType

extension OfficialJokeAPIRequest {
    /// Category of joke to fetch.
    public struct JokeType {
        let value: Value
    }
}

extension OfficialJokeAPIRequest.JokeType {
    /// Fetch joke of any category.
    public static let any = OfficialJokeAPIRequest.JokeType(value: .any)

    public static let dad = OfficialJokeAPIRequest.JokeType(value: .dad)
    public static let general = OfficialJokeAPIRequest.JokeType(value: .general)
    public static let knockKnock = OfficialJokeAPIRequest.JokeType(value: .knockKnock)
    public static let programming = OfficialJokeAPIRequest.JokeType(value: .programming)
}

// MARK: Codable

extension OfficialJokeAPIRequest.JokeType: Codable {}

// MARK: Hashable

extension OfficialJokeAPIRequest.JokeType: Hashable {}

// MARK: Sendable

extension OfficialJokeAPIRequest.JokeType: Sendable {}

// MARK: - JokeType.Value

extension OfficialJokeAPIRequest.JokeType {
    enum Value {
        case any
        case dad
        case general
        case knockKnock
        case programming
    }
}

// MARK: Codable

extension OfficialJokeAPIRequest.JokeType.Value: Codable {}

// MARK: Hashable

extension OfficialJokeAPIRequest.JokeType.Value: Hashable {}

// MARK: Sendable

extension OfficialJokeAPIRequest.JokeType.Value: Sendable {}
