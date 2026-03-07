// Copyright © 2026 Brent Tunnicliff <brent@tunnicliff.dev>

import ArgumentParser
import SwiftJoke

@main
struct JokeExecutable: AsyncParsableCommand {
    mutating func run() async throws {
        let jokeService = JokeService.shared
//        let joke = try await jokeProvider.getRandomJoke()
//        print("Joke: '\(joke)'")
    }
}
