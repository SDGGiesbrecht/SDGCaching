/*
 ReadMe.swift

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 */

/*
 ReadMe.swift

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2016–2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 */

// [_Define Example: Read‐Me_]
import SDGCaching

// This example uses SDGCaching to cache the computed properties of a structure.

struct Number {

    // MARK: - Initialization

    init(value: Int) {
        self.value = value
    }

    // MARK: - Stored Property

    var value: Int {
        willSet {
            // Empty the cache whenever the value property changes.
            cache = Cache()
        }
    }

    // MARK: - Cache

    private class Cache {
        var square: Int?
        var powers: [Int: Int] = [:]
    }
    private var cache = Cache()

    // MARK: - Computed Properties

    // These will only be executed once as long as the value property stays the same.
    // When the value property changes, they will be re‐executed the next time they are needed.

    var square: Int {
        return cached(in: &cache.square) {

            var result = 0
            for _ in 1 ... value {
                result += value
            }
            return result
        }
    }

    func toPower(of exponent: Int) -> Int {

        // This makes use of a dictionary to separate the cache for each exponent.
        return cached(in: &cache.powers[exponent]) {

            var result = 0
            for _ in 1 ... exponent {
                for _ in 1 ... value {
                    result += value
                }
            }
            return result
        }
    }
}
// [_End_]
