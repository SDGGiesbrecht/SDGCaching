<!--
 🇺🇸EN Read Me.md

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 -->

<!--
 !!!!!!! !!!!!!! !!!!!!! !!!!!!! !!!!!!! !!!!!!! !!!!!!!
 This file is managed by Workspace.
 Manual changes will not persist.
 For more information, see:
 https://github.com/SDGGiesbrecht/Workspace/blob/master/Documentation/Read‐Me.md
 !!!!!!! !!!!!!! !!!!!!! !!!!!!! !!!!!!! !!!!!!! !!!!!!!
 -->

[🇨🇦EN](🇨🇦EN%20Read%20Me.md) • [🇬🇧EN](🇬🇧EN%20Read%20Me.md) • [🇺🇸EN](🇺🇸EN%20Read%20Me.md) • [🇩🇪DE](🇩🇪DE%20Lies%20mich.md) • [🇫🇷FR](🇫🇷FR%20Lisez%20moi.md) <!--Skip in Jazzy-->

APIs: [macOS](https://sdggiesbrecht.github.io/SDGCaching/macOS) • [Linux](https://sdggiesbrecht.github.io/SDGCaching/Linux) • [iOS](https://sdggiesbrecht.github.io/SDGCaching/iOS) • [watchOS](https://sdggiesbrecht.github.io/SDGCaching/watchOS) • [tvOS](https://sdggiesbrecht.github.io/SDGCaching/tvOS)

# SDGCaching

**⚠ This project is obsolete. It has been superseded by [SDGCornerstone](https://github.com/SDGGiesbrecht/SDGCornerstone). ⚠**

SDGCaching automates caching for results of complex or time‐consuming functions.

> [רַק הִשָּׁמֶר לְךָ וּשְׁמֹר נַפְשְׁךָ מְאֹד פֶּן־תִּשְׁכַּח אֶת־הַדְּבָרִים אֲשֶׁר־רָאוּ עֵינֶיךָ וּפֶן־יָסוּרוּ מִלְּבָבְךָ כֹּל יְמֵי חַיֶּיךָ וְהוֹדַעְתָּם לְבָנֶיךָ וְלִבְנֵי בָנֶיךָ׃<br>Only watch yourself, and guard your soul carefully lest you forget the things your eyes have seen and let them fade from your heart all the days of your life. Make them known to your sons and to your sons’ sons.](https://www.biblegateway.com/passage/?search=Deuteronomy+4&version=WLC;NIV)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;―‎משה/Moshe

## Features

- Automated caching for results of complex or time‐consuming functions via `cached(in::)`.

(For a list of related projecs, see [here](🇺🇸EN%20Related%20Projects.md).) <!--Skip in Jazzy-->

## Importing

SDGCaching is intended for use with the [Swift Package Manager](https://swift.org/package-manager/).

Simply add SDGCaching as a dependency in `Package.swift`:

```swift
let package = Package(
    ...
    dependencies: [
        ...
        .Package(url: "https://github.com/SDGGiesbrecht/SDGCaching", versions: "2.1.0" ..< "3.0.0"),
        ...
    ]
)
```

SDGCaching can then be imported in source files:

```swift
import SDGCaching
```

## Example Usage

```swift
import SDGCaching

// This example uses SDGCaching to cache the computed properties of a structure.

private struct Number {

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
```

## About

The SDGCaching project is maintained by Jeremy David Giesbrecht.

If SDGCaching saves you money, consider giving some of it as a [donation](https://paypal.me/JeremyGiesbrecht).

If SDGCaching saves you time, consider devoting some of it to [contributing](https://github.com/SDGGiesbrecht/SDGCaching) back to the project.

> [Ἄξιος γὰρ ὁ ἐργάτης τοῦ μισθοῦ αὐτοῦ ἐστι.<br>For the worker is worthy of his wages.](https://www.biblegateway.com/passage/?search=Luke+10&version=SBLGNT;NIV)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;―‎ישוע/Yeshuʼa
