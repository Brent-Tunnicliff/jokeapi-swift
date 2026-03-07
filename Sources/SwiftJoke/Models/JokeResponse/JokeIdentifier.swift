// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

import Crypto

#if canImport(FoundationEssentials)
    public import FoundationEssentials
#else
    public import Foundation
#endif

/// Unique identifier for joke response.
///
/// UUID v5 based on <https://stackoverflow.com/a/48076401>.
/// This allows us to have a deterministic identifier for each joke even though some sources don't return id's with their jokes.
public struct JokeIdentifier {
    let value: UUID

    public init(value: UUID) {
        self.value = value
    }
}

extension JokeIdentifier {
    init(source: Source, name: String) {
        self.init(nameSpace: source.id, name: name)
    }

    init(nameSpace: UUID, name: String) {
        // Build input: namespace UUID bytes followed by UTF-8 of name
        var ns = nameSpace.uuid
        var data = withUnsafeBytes(of: &ns) { Data($0) }
        data.append(contentsOf: name.utf8)

        // Compute SHA-1 digest
        let digest = Insecure.SHA1.hash(data: data)

        // Take first 16 bytes for UUID
        var bytes = Array(digest.prefix(16))

        // Set version (5) and variant (RFC 4122) bits
        bytes[6] = (bytes[6] & 0x0F) | (5 << 4)
        bytes[8] = (bytes[8] & 0x3F) | 0x80

        // Create UUID from bytes
        let uuid = bytes.withUnsafeBytes { rawBuf -> UUID in
            guard let baseAddress = rawBuf.bindMemory(to: UInt8.self).baseAddress else {
                preconditionFailure(
                    "Failed to get base address of UUID bytes, nameSpace: '\(nameSpace)', name: '\(name)'"
                )
            }

            return NSUUID(uuidBytes: baseAddress) as UUID
        }

        self.init(value: uuid)
    }
}

// MARK: Codable

extension JokeIdentifier: Codable {}

// MARK: - CustomDebugStringConvertible

extension JokeIdentifier: CustomDebugStringConvertible {
    public var debugDescription: String {
        value.debugDescription
    }
}

// MARK: CustomStringConvertible

extension JokeIdentifier: CustomStringConvertible {
    public var description: String {
        value.description.lowercased()
    }
}

// MARK: Hashable

extension JokeIdentifier: Hashable {}

// MARK: Sendable

extension JokeIdentifier: Sendable {}
