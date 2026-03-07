// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - JokeResponse

public struct JokeResponse {
    public let id: JokeIdentifier
    public var joke: any JokeStructure {
        innerJoke.structure
    }

    public let source: Source

    let innerJoke: Joke
}

extension JokeResponse {
    public init(
        id: JokeIdentifier,
        simpleJokeStructure: SimpleJokeStructure,
        source: Source
    ) {
        self.init(
            id: id,
            source: source,
            innerJoke: .simpleJokeStructure(simpleJokeStructure)
        )
    }

    public init(
        id: JokeIdentifier,
        twoPartJokeStructure: TwoPartJokeStructure,
        source: Source
    ) {
        self.init(
            id: id,
            source: source,
            innerJoke: .twoPartJokeStructure(twoPartJokeStructure)
        )
    }
}

// MARK: Codable

extension JokeResponse: Codable {}

// MARK: Hashable

extension JokeResponse: Hashable {}

// MARK: Identifiable

extension JokeResponse: Identifiable {}

// MARK: Sendable

extension JokeResponse: Sendable {}

// MARK: - Joke

extension JokeResponse {
    // Keeping enum internal to protect consumers from breaking changes.
    enum Joke {
        case simpleJokeStructure(SimpleJokeStructure)
        case twoPartJokeStructure(TwoPartJokeStructure)
    }
}

extension JokeResponse.Joke {
    var structure: any JokeStructure {
        switch self {
        case let .simpleJokeStructure(simpleJokeStructure): simpleJokeStructure
        case let .twoPartJokeStructure(twoPartJokeStructure): twoPartJokeStructure
        }
    }
}

// MARK: Codable

extension JokeResponse.Joke: Codable {}

// MARK: Hashable

extension JokeResponse.Joke: Hashable {}

// MARK: Sendable

extension JokeResponse.Joke: Sendable {}
