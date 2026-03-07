// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    public import FoundationNetworking
#else
    public import Foundation
#endif

/// Configuration for requesting jokes from the [JokeAPI](https://sv443.net/jokeapi/v2/) source.
public struct JokeAPIRequest {
    public let amount: Int
    public let blacklistFlags: [BlacklistFlag]
    public let categories: Categories
    public let contains: String?
    public let idRange: ClosedRange<Int>?
    public let lang: Language
    public let type: JokeType
}

// MARK: JokeRequest

extension JokeAPIRequest: JokeRequest {
    public var asURLRequest: URLRequest {
        fatalError("Not yet implemented")
    }
}

// MARK: MultipleJokesRequest

extension JokeAPIRequest: MultipleJokesRequest {}

extension MultipleJokesRequest where Self == JokeAPIRequest {
    public static func jokeAPI(
        amount: Int,
        blacklistFlags: [Self.BlacklistFlag] = [],
        categories: Self.Categories = .any,
        contains: String? = nil,
        idRange: ClosedRange<Int>? = nil,
        lang: Self.Language = .english,
        type: Self.JokeType = .any
    ) -> Self {
        JokeAPIRequest(
            amount: amount,
            blacklistFlags: blacklistFlags,
            categories: categories,
            contains: contains,
            idRange: idRange,
            lang: lang,
            type: type
        )
    }
}

// MARK: SingleJokeRequest

extension JokeAPIRequest: SingleJokeRequest {}

extension SingleJokeRequest where Self == JokeAPIRequest {
    public static func jokeAPI(
        blacklistFlags: [Self.BlacklistFlag] = [],
        categories: Self.Categories = .any,
        contains: String? = nil,
        idRange: ClosedRange<Int>? = nil,
        lang: Self.Language = .english,
        type: Self.JokeType = .any
    ) -> Self {
        JokeAPIRequest(
            amount: 1,
            blacklistFlags: blacklistFlags,
            categories: categories,
            contains: contains,
            idRange: idRange,
            lang: lang,
            type: type
        )
    }
}
