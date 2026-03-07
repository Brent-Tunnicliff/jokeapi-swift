// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    public import FoundationEssentials
#else
    public import Foundation
#endif

// MARK: - Source

public struct Source {
    let value: Value
}

extension Source {
    /// Represents the source [JokeAPI](https://sv443.net/jokeapi/v2/).
    public static let jokeAPI: Source = Source(value: .jokeAPI)

    /// Represents the source [Official Joke API](https://github.com/15Dkatz/official_joke_api).
    public static let officialJokeAPI: Source = Source(value: .officialJokeAPI)
}

// MARK: CaseIterable

extension Source: CaseIterable {
    public static let allCases: [Source] = Source.Value.allCases.map(Source.init(value:))
}

// MARK: Codable

extension Source: Codable {}

// MARK: CustomStringConvertible

extension Source: CustomStringConvertible {
    public var description: String {
        value.description
    }
}

// MARK: - Identifiable

extension Source: Identifiable {
    public var id: UUID {
        value.nameSpace
    }
}

// MARK: Hashable

extension Source: Hashable {}

// MARK: Sendable

extension Source: Sendable {}

// MARK: - Source.Value

extension Source {
    enum Value {
        case jokeAPI
        case officialJokeAPI
    }
}

extension Source.Value {
    /// The unique UUID for the source.
    ///
    /// These are randomly generated v4 UUID's, the exact values do not matter, only that each source is unique and don't change.
    var nameSpace: UUID {
        let nameSpace = switch self {
        case .jokeAPI:
            "0da39001-37fe-4c7c-9900-6ea792efc979"
        case .officialJokeAPI:
            "785bd1b9-9193-40ea-8c08-d630b5e3b526"
        }

        guard let uuid = UUID(uuidString: nameSpace) else {
            preconditionFailure("Unable to create uuid from '\(nameSpace)'")
        }

        return uuid
    }
}

// MARK: CaseIterable

extension Source.Value: CaseIterable {}

// MARK: Codable

extension Source.Value: Codable {}

// MARK: - CustomStringConvertible

extension Source.Value: CustomStringConvertible {
    public var description: String {
        switch self {
        case .jokeAPI: "joke_api"
        case .officialJokeAPI: "official_joke_api"
        }
    }
}

// MARK: Hashable

extension Source.Value: Hashable {}

// MARK: Sendable

extension Source.Value: Sendable {}
