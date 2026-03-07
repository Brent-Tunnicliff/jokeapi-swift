// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - HardcodedAmount

extension OfficialJokeAPIRequest {
    /// Amount of jokes to retrieve in the request.
    ///
    /// When getting a joke with `JokeType` we can only use hard coded amount.
    public struct HardcodedAmount {
        let value: Value
    }
}

extension OfficialJokeAPIRequest.HardcodedAmount {
    public static let one = OfficialJokeAPIRequest.HardcodedAmount(value: .one)
    public static let ten = OfficialJokeAPIRequest.HardcodedAmount(value: .ten)
}

extension OfficialJokeAPIRequest.HardcodedAmount {
    public var asInt: Int {
        switch value {
        case .one: 1
        case .ten: 10
        }
    }
}

// MARK: CaseIterable

extension OfficialJokeAPIRequest.HardcodedAmount: CaseIterable {
    public static let allCases = Value.allCases.map(OfficialJokeAPIRequest.HardcodedAmount.init(value:))
}

// MARK: Codable

extension OfficialJokeAPIRequest.HardcodedAmount: Codable {}

// MARK: Hashable

extension OfficialJokeAPIRequest.HardcodedAmount: Hashable {}

// MARK: Sendable

extension OfficialJokeAPIRequest.HardcodedAmount: Sendable {}

// MARK: - HardcodedAmount.Value

extension OfficialJokeAPIRequest.HardcodedAmount {
    enum Value {
        case one
        case ten
    }
}

// MARK: CaseIterable

extension OfficialJokeAPIRequest.HardcodedAmount.Value: CaseIterable {}

// MARK: Codable

extension OfficialJokeAPIRequest.HardcodedAmount.Value: Codable {}

// MARK: Hashable

extension OfficialJokeAPIRequest.HardcodedAmount.Value: Hashable {}

// MARK: Sendable

extension OfficialJokeAPIRequest.HardcodedAmount.Value: Sendable {}
