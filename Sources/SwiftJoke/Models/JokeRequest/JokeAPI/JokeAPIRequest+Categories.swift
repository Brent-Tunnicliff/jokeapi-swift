// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - Categories

extension JokeAPIRequest {
    /// Category of joke to fetch.
    public struct Categories {
        let value: Value
    }
}

extension JokeAPIRequest.Categories {
    /// Fetch joke of any category.
    public static let `any` = JokeAPIRequest.Categories(value: .any)

    /// Fetch joke from category of inputs.
    public static func custom(_ options: Set<Option>) -> JokeAPIRequest.Categories {
        JokeAPIRequest.Categories(value: .custom(options))
    }
}

// MARK: Codable

extension JokeAPIRequest.Categories: Codable {}

// MARK: Hashable

extension JokeAPIRequest.Categories: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.Categories: Sendable {}

// MARK: - Category.Value

extension JokeAPIRequest.Categories {
    // Keeping enum internal to protect consumers from breaking changes.
    enum Value {
        case any
        case custom(Set<Option>)
    }
}

// MARK: Codable

extension JokeAPIRequest.Categories.Value: Codable {}

// MARK: Hashable

extension JokeAPIRequest.Categories.Value: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.Categories.Value: Sendable {}

// MARK: - Option

extension JokeAPIRequest.Categories {
    /// Category option.
    public struct Option {
        let value: Value
    }
}

extension JokeAPIRequest.Categories.Option {
    /// Christmas jokes.
    public static let christmas = JokeAPIRequest.Categories.Option(value: .christmas)

    /// Dark jokes.
    public static let dark = JokeAPIRequest.Categories.Option(value: .dark)

    /// Miscellaneous jokes.
    public static let miscellaneous = JokeAPIRequest.Categories.Option(value: .miscellaneous)

    /// Programming jokes.
    public static let programming = JokeAPIRequest.Categories.Option(value: .programming)

    /// Puns.
    public static let pun = JokeAPIRequest.Categories.Option(value: .pun)

    /// Spooky jokes.
    public static let spooky = JokeAPIRequest.Categories.Option(value: .spooky)
}

// MARK: CaseIterable

extension JokeAPIRequest.Categories.Option: CaseIterable {
    /// All Category options.
    public static let allCases = Value.allCases.map(JokeAPIRequest.Categories.Option.init)
}

// MARK: Codable

extension JokeAPIRequest.Categories.Option: Codable {}

// MARK: Hashable

extension JokeAPIRequest.Categories.Option: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.Categories.Option: Sendable {}

// MARK: - Option.Value

extension JokeAPIRequest.Categories.Option {
    // Keeping enum internal to protect consumers from breaking changes.
    enum Value {
        case christmas
        case dark
        case miscellaneous
        case programming
        case pun
        case spooky
    }
}

// MARK: CaseIterable

extension JokeAPIRequest.Categories.Option.Value: CaseIterable {}

// MARK: Codable

extension JokeAPIRequest.Categories.Option.Value: Codable {}

// MARK: Hashable

extension JokeAPIRequest.Categories.Option.Value: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.Categories.Option.Value: Sendable {}
