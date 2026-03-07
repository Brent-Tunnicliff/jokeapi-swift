// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    public import FoundationNetworking
#else
    public import Foundation
#endif

public protocol JokeRequest: Codable, Hashable, Sendable {
    var asURLRequest: URLRequest { get }
}

public protocol MultipleJokesRequest: JokeRequest {}

public protocol SingleJokeRequest: JokeRequest {}
