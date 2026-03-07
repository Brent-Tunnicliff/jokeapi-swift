// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    public import FoundationNetworking
#else
    public import Foundation
#endif

/// Configuration for requesting jokes from any source.
///
/// Only supports customising request by amount, if want to customise further use the specific sources directly.
public struct AnyRequest {
    public let amount: Int
}

// MARK: JokeRequest

extension AnyRequest: JokeRequest {
    /// Return the url request for a random source.
    public var asURLRequest: URLRequest {
        guard let randomSource = Source.allCases.randomElement() else {
            preconditionFailure("Unexpected zero sources")
        }

        return randomSource.request(amount: amount).asURLRequest
    }
}

extension Source {
    fileprivate func request(amount: Int) -> any MultipleJokesRequest {
        switch value {
        case .jokeAPI: .jokeAPI(amount: amount)
        case .officialJokeAPI: .officialJokeAPIRequest(amount: amount)
        }
    }
}

// MARK: MultipleJokesRequest

extension AnyRequest: MultipleJokesRequest {}

extension MultipleJokesRequest where Self == AnyRequest {
    public static func any(
        amount: Int
    ) -> Self {
        AnyRequest(amount: amount)
    }
}

// MARK: SingleJokeRequest

extension AnyRequest: SingleJokeRequest {}

extension SingleJokeRequest where Self == AnyRequest {
    public static var any: Self {
        AnyRequest(amount: 1)
    }
}
