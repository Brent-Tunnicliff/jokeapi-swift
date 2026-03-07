// Copyright © 2025 Brent Tunnicliff <brent@tunnicliff.dev>

#if canImport(FoundationEssentials)
    import FoundationEssentials
    import FoundationNetworking
#else
    import Foundation
#endif

// MARK: - NetworkService

protocol NetworkService: Sendable {
    func data(for request: URLRequest) async throws -> (data: Data, response: URLResponse)
}

// MARK: - DefaultNetworkService

final class DefaultNetworkService {
    private let session: URLSession

    convenience init() {
        self.init(session: .shared)
    }

    init(session: URLSession) {
        self.session = session
    }
}

extension DefaultNetworkService: NetworkService {
    func data(for request: URLRequest) async throws -> (data: Data, response: URLResponse) {
        try await session.data(for: request)
    }
}
