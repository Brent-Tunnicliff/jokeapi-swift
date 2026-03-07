// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    public import FoundationEssentials
#else
    public import Foundation
#endif

// MARK: - Language

extension JokeAPIRequest {
    /// Supported languages.
    public struct Language {
        let value: Value
    }
}

extension JokeAPIRequest.Language {
    /// Jokes in Czech language.
    public static let czech = JokeAPIRequest.Language(value: .czech)

    /// Jokes in English language.
    public static let english = JokeAPIRequest.Language(value: .english)

    /// Jokes in French language.
    public static let french = JokeAPIRequest.Language(value: .french)

    /// Jokes in German language.
    public static let german = JokeAPIRequest.Language(value: .german)

    /// Jokes in Portuguese language.
    public static let portuguese = JokeAPIRequest.Language(value: .portuguese)

    /// Jokes in Spanish language.
    public static let spanish = JokeAPIRequest.Language(value: .spanish)
}

extension JokeAPIRequest.Language {
    /// Create from Locale.
    ///
    /// If does not match a supported language then sets it as English.
    public init(locale: Locale) {
        self.init(languageCode: locale.language.languageCode?.identifier ?? "")
    }

    init(languageCode: String) {
        self.value = Value.allCases.first(where: { $0.code == languageCode }) ?? .english
    }
}

// MARK: CaseIterable

extension JokeAPIRequest.Language: CaseIterable {
    public static let allCases = JokeAPIRequest.Language.Value.allCases.map(JokeAPIRequest.Language.init(value:))
}

// MARK: Codable

extension JokeAPIRequest.Language: Codable {}

// MARK: Hashable

extension JokeAPIRequest.Language: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.Language: Sendable {}

// MARK: - Language.Value

extension JokeAPIRequest.Language {
    // Keeping enum internal to protect consumers from breaking changes.
    enum Value {
        case czech
        case english
        case french
        case german
        case portuguese
        case spanish
    }
}

extension JokeAPIRequest.Language.Value {
    var code: String {
        switch self {
        case .czech: "cs"
        case .english: "en"
        case .french: "fr"
        case .german: "de"
        case .portuguese: "pt"
        case .spanish: "es"
        }
    }
}

// MARK: CaseIterable

extension JokeAPIRequest.Language.Value: CaseIterable {}

// MARK: Codable

extension JokeAPIRequest.Language.Value: Codable {}

// MARK: Hashable

extension JokeAPIRequest.Language.Value: Hashable {}

// MARK: Sendable

extension JokeAPIRequest.Language.Value: Sendable {}
