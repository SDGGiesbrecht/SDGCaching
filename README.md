[![Build Status](https://travis-ci.org/SDGGiesbrecht/SDGCaching.svg?branch=master)](https://travis-ci.org/SDGGiesbrecht/SDGCaching)

# SDGCaching

SDGCaching automates caching for results of complex or time‐consuming functions.

## SDGCaching provides:

* Automated caching for results of complex or time‐consuming functions via `cachedResult(cache:computation:)`, etc.

(For a list of other modules in the SDG family, see [here](https://github.com/SDGGiesbrecht/SDG/blob/master/README.md).)

## Importing

SDGCaching is intended for use with the [Swift Package Manager](https://swift.org/package-manager/).

Simply add SDGCaching as a dependency in `Package.swift`:

```swift
let package = Package(
    ...
    dependencies: [
        ...
        .Package(url: "https://github.com/SDGGiesbrecht/SDGCaching", versions: "1.0.0" ..< "2.0.0")
    ]
)
```

SDGCaching can then be imported in source files:

```swift
import SDGCaching
```

## Usage Example

This example uses SDGCaching to cache the computed properties of a structure:

```swift
import SDGCaching

struct Number {
    
    var value: Int {
        willSet {
            cache = Cache()
        }
    }
    
    init(value: Int) {
        self.value = value
    }
    
    private class Cache {
        var square: Int?
        var powers: [Int: Int] = [:]
    }
    private var cache = Cache()
    
    var square: Int {
        return cachedResult(cache: &cache.square) {

            var result = 0
            for _ in 1 ... value {
                result += value
            }
            return result
        }
    }
    
    func toThePowerOf(_ exponent: Int) -> Int {
        return cachedResult(cache: &cache.powers, parameter: exponent) {
            (exponent: Int) -> Int in

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
```

The slow calculations in `square` and `toThePowerOf(_:)` will only be executed once as long as `value` stays the same. When `value` is changed, the cache is reinitialized, and the calculations will be re‐executed the next time they are needed.

## Documentation:

Complete API documentation is available [here](https://sdggiesbrecht.github.io/SDGCaching/).
