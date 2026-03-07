//// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>
//
//#if canImport(FoundationEssentials)
//    import FoundationEssentials
//#else
//    import Foundation
//#endif
//
///// Wrapper of [JokeAPI](https://sv443.net/jokeapi/v2/).
//final class JokeAPIService {
//    private let baseURL: URL
//    private let networkService: any NetworkService
//
//    convenience init() {
//        let baseURLString = "https://v2.jokeapi.dev"
//        guard let baseURL = URL(string: baseURLString) else {
//            preconditionFailure("Unable to create URL from string: '\(baseURLString)'")
//        }
//
//        self.init(
//            baseURL: baseURL,
//            networkService: DefaultNetworkService()
//        )
//    }
//
//    init(
//        baseURL: URL,
//        networkService: any NetworkService
//    ) {
//        self.baseURL = baseURL
//        self.networkService = networkService
//    }
//
////    public func getRandomJoke() async throws -> String {
////        let jokeURL = baseURL.appendingPathComponent("joke").appendingPathComponent("Any")
////        let result = try await networkService.data(from: jokeURL)
////        return String(data: result.data, encoding: .utf8) ?? ""
////    }
//
////    public func getJokes(
////        amount: Int = 1,
////        blacklistFlags: [BlacklistFlag] = [],
////        categories: Category = .any,
////        contains: String? = nil,
////        idRange: ClosedRange<Int>? = nil,
////        lang: Language = .english,
////        type: JokeType? = nil
////    ) async throws(JokeError) -> [Joke] {
////        let queryItems: [URLQueryItem] = [
////            amountQueryItem(value: amount)
////        ]
////
////        let jokeURL = baseURL
////            .appendingPathComponent("joke")
////            .appendingPathComponent(categories.pathComponent)
////
////        let request = URLRequest(url: jokeURL)
////
////        do {
////            let result = try await networkService.data(for: request)
////            //        return String(data: result.data, encoding: .utf8) ?? ""
////            return []
////        } catch {
////            // TODO: implement
////            fatalError()
////        }
////    }
//
//    private func amountQueryItem(value: Int) -> URLQueryItem {
//        URLQueryItem(name: "amount", value: value.description)
//    }
//}
