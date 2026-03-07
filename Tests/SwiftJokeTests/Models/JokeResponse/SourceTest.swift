// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

import Testing

@testable import SwiftJoke

#if canImport(FoundationEssentials)
    import FoundationEssentials
#else
    import Foundation
#endif

struct SourceTest {
    @Test
    func nameSpacesAreUnique() {
        let allSources = Source.allCases
        var results: [UUID: [Source]] = [:]
        for source in allSources {
            let identifier = source.id
            let previousSources = results[identifier] ?? []
            results[identifier] = previousSources + [source]
        }

        #expect(results.count == allSources.count)

        for (identifier, sources) in results {
            #expect(
                sources.count == 1,
                "identifier '\(identifier)' for sources \(sources.map(\.description).joined(separator: ", "))"
            )
        }
    }
}
