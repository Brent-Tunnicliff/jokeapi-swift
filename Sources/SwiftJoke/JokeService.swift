// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    import FoundationEssentials
#else
    import Foundation
#endif

public final class JokeService {
    /// Shared singleton instance.
    public static let shared = JokeService()

    private let networkService: any NetworkService

    convenience init() {
        self.init(networkService: DefaultNetworkService())
    }

    init(networkService: any NetworkService) {
        self.networkService = networkService
    }

    public func joke(from request: any SingleJokeRequest = .any) -> JokeResponse {
        fatalError("Not yet implemented")
    }

    public func jokes(from request: any MultipleJokesRequest = .any(amount: 10)) -> [JokeResponse] {
        fatalError("Not yet implemented")
    }

//    public func joke() -> JokeService {
//
//    }

//    public func getRandomJoke() async throws -> String {
//        let jokeURL = baseURL.appendingPathComponent("joke").appendingPathComponent("Any")
//        let result = try await networkService.data(from: jokeURL)
//        return String(data: result.data, encoding: .utf8) ?? ""
//    }

//    public func getJokes(
//        amount: Int = 1,
//        blacklistFlags: [BlacklistFlag] = [],
//        categories: Category = .any,
//        contains: String? = nil,
//        idRange: ClosedRange<Int>? = nil,
//        lang: Language = .english,
//        type: JokeType? = nil
//    ) async throws(JokeError) -> [Joke] {
//        let queryItems: [URLQueryItem] = [
//            amountQueryItem(value: amount)
//        ]
//
//        let jokeURL = baseURL
//            .appendingPathComponent("joke")
//            .appendingPathComponent(categories.pathComponent)
//
//        let request = URLRequest(url: jokeURL)
//
//        do {
//            let result = try await networkService.data(for: request)
//            //        return String(data: result.data, encoding: .utf8) ?? ""
//            return []
//        } catch {
//            // TODO: implement
//            fatalError()
//        }
//    }
//
//    private func amountQueryItem(value: Int) -> URLQueryItem {
//        URLQueryItem(name: "amount", value: value.description)
//    }
}

extension JokeService: Sendable {}

//extension Category {
//    fileprivate var pathComponent: String {
//        switch inner {
//        case let .custom(value) where value.isEmpty == false:
//            value.map(\.inner.pathComponent).joined(separator: ",")
//        // Treat empty custom options the same as any.
//        case .any, .custom:
//            "Any"
//        }
//    }
//}
//
//extension Category.Option.Inner {
//    fileprivate var pathComponent: String {
//        switch self {
//        case .christmas: "Christmas"
//        case .dark: "Dark"
//        case .miscellaneous: "Miscellaneous"
//        case .programming: "Programming"
//        case .pun: "Pun"
//        case .spooky: "Spooky"
//        }
//    }
//}

//protocol ExampleType: Sendable {
//    static var shared: Self { get }
//}
//
//extension ExampleType where Self == DefaultExampleType {
//    static var `default`: DefaultExampleType {
//        .shared
//    }
//}
//
//final class DefaultExampleType: ExampleType {
//    static let shared = DefaultExampleType()
//}
//
//func doStuff(_ value: any ExampleType) {}

//extension ExampleType where Self == DefaultExampleType {
//
//}
