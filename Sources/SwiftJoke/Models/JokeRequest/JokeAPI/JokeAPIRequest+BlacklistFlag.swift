// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - BlacklistFlag

extension JokeAPIRequest {
    /// Jokes that match the specified flag(s) will not be served.
    public struct BlacklistFlag {
        let value: Value
    }
}

extension JokeAPIRequest.BlacklistFlag {
    /// Do not return explicit jokes.
    public static let explicit = JokeAPIRequest.BlacklistFlag(value: .explicit)

    /// Do not return not safe for work (NSFW) jokes.
    public static let nsfw = JokeAPIRequest.BlacklistFlag(value: .nsfw)

    /// Do not return political jokes.
    public static let political = JokeAPIRequest.BlacklistFlag(value: .political)

    /// Do not return racist jokes.
    public static let racist = JokeAPIRequest.BlacklistFlag(value: .racist)

    /// Do not return religious jokes.
    public static let religious = JokeAPIRequest.BlacklistFlag(value: .religious)

    /// Do not return sexist jokes.
    public static let sexist = JokeAPIRequest.BlacklistFlag(value: .sexist)
}

// MARK: CaseIterable

extension JokeAPIRequest.BlacklistFlag: CaseIterable {
    /// All Blacklist flags.
    public static let allCases = Value.allCases.map(JokeAPIRequest.BlacklistFlag.init)
}

// MARK: Codable

extension JokeAPIRequest.BlacklistFlag: Codable {}

// MARK: Hashable

extension JokeAPIRequest.BlacklistFlag: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.BlacklistFlag: Sendable {}

// MARK: - Value

extension JokeAPIRequest.BlacklistFlag {
    // Keeping enum internal to protect consumers from breaking changes.
    enum Value {
        case explicit
        case nsfw
        case political
        case racist
        case religious
        case sexist
    }
}

// MARK: CaseIterable

extension JokeAPIRequest.BlacklistFlag.Value: CaseIterable {}

// MARK: Codable

extension JokeAPIRequest.BlacklistFlag.Value: Codable {}

// MARK: Hashable

extension JokeAPIRequest.BlacklistFlag.Value: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.BlacklistFlag.Value: Sendable {}
