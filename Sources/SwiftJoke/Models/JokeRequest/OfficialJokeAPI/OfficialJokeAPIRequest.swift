// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

import URLMacro

#if canImport(FoundationEssentials)
    public import FoundationNetworking
#else
    public import Foundation
#endif

/// Configuration for requesting jokes from the [Official Joke API](https://github.com/15Dkatz/official_joke_api) source.
public struct OfficialJokeAPIRequest {
    public let amount: Amount
    public let jokeType: JokeType

    init() {
        self.amount = .hardcoded(.one)
        self.jokeType = .any
    }

    init(jokeType: JokeType, amount: HardcodedAmount) {
        self.amount = .hardcoded(amount)
        self.jokeType = jokeType
    }

    init(amount: Int) {
        self.amount = .flexible(amount)
        self.jokeType = .any
    }
}

// MARK: JokeRequest

extension OfficialJokeAPIRequest: JokeRequest {
    private static let baseURL = #url("https://official-joke-api.appspot.com")

    public var asURLRequest: URLRequest {
        let pathComponents: [String] = [
            jokeType.pathComponent,
            amount.pathComponent
        ].compactMap { $0 }

        var url = Self.baseURL

        for pathComponent in pathComponents {
            url.append(component: pathComponent)
        }

        return URLRequest(url: url)
    }
}

extension OfficialJokeAPIRequest.Amount {
    fileprivate var pathComponent: String {
        switch value {
        case let .flexible(value): value.description
        case let .hardcoded(value): value.pathComponent
        }
    }
}

extension OfficialJokeAPIRequest.HardcodedAmount {
    fileprivate var pathComponent: String {
        switch value {
        case .one: "random"
        case .ten: "ten"
        }
    }
}

extension OfficialJokeAPIRequest.JokeType {
    fileprivate var pathComponent: String? {
        switch value {
        case .any: nil
        case .dad: "dad"
        case .general: "general"
        case .knockKnock: "knock-knock"
        case .programming: "programming"
        }
    }
}

// MARK: MultipleJokesRequest

extension OfficialJokeAPIRequest: MultipleJokesRequest {}

extension MultipleJokesRequest where Self == OfficialJokeAPIRequest {
    public static func officialJokeAPIRequest(amount: Int) -> Self {
        OfficialJokeAPIRequest(amount: amount)
    }

    /// Request ten jokes of specific type.
    public static func officialJokeAPIRequest(jokeType: OfficialJokeAPIRequest.JokeType) -> Self {
        OfficialJokeAPIRequest(jokeType: jokeType, amount: .ten)
    }
}

// MARK: SingleJokeRequest

extension OfficialJokeAPIRequest: SingleJokeRequest {}

extension SingleJokeRequest where Self == OfficialJokeAPIRequest {
    public static var officialJokeAPIRequest: Self {
        OfficialJokeAPIRequest()
    }

    public static func officialJokeAPIRequest(jokeType: OfficialJokeAPIRequest.JokeType) -> Self {
        OfficialJokeAPIRequest(jokeType: jokeType, amount: .one)
    }
}
