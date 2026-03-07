// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

// MARK: - Amount

extension OfficialJokeAPIRequest {
    public struct Amount {
        let value: Value
    }
}

extension OfficialJokeAPIRequest.Amount {
    public static func flexible(_ count: Int) -> OfficialJokeAPIRequest.Amount {
        OfficialJokeAPIRequest.Amount(value: .flexible(count))
    }

    public static func hardcoded(_ count: OfficialJokeAPIRequest.HardcodedAmount) -> OfficialJokeAPIRequest.Amount {
        OfficialJokeAPIRequest.Amount(value: .hardcoded(count))
    }
}

extension OfficialJokeAPIRequest.Amount {
    public var asHardcodedAmount: OfficialJokeAPIRequest.HardcodedAmount? {
        switch value {
        case .flexible: nil
        case let .hardcoded(value): value
        }
    }

    public var asInt: Int {
        switch value {
        case let .flexible(value): value
        case let .hardcoded(value): value.asInt
        }
    }
}

// MARK: Codable

extension OfficialJokeAPIRequest.Amount: Codable {}

// MARK: Hashable

extension OfficialJokeAPIRequest.Amount: Hashable {}

// MARK: Sendable

extension OfficialJokeAPIRequest.Amount: Sendable {}

// MARK: - Amount.Value

extension OfficialJokeAPIRequest.Amount {
    enum Value {
        case flexible(Int)
        case hardcoded(OfficialJokeAPIRequest.HardcodedAmount)
    }
}

// MARK: Codable

extension OfficialJokeAPIRequest.Amount.Value: Codable {}

// MARK: Hashable

extension OfficialJokeAPIRequest.Amount.Value: Hashable {}

// MARK: Sendable

extension OfficialJokeAPIRequest.Amount.Value: Sendable {}
