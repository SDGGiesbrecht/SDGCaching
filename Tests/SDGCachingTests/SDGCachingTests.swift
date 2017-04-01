/*
 SDGCachingTests.swift

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2016–2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 */

import XCTest
@testable import SDGCaching

class SDGCachingTests : XCTestCase {

    func testCaching() {

        var callCount = 0
        func compute() -> Bool {
            callCount += 1
            return true
        }
        func compute(_ parameter: Bool) -> Bool {
            callCount += 1
            return parameter
        }

        var cache: Bool?
        var parameterizedCache: [Bool: Bool] = [:]

        XCTAssert(cached(in: &cache, compute) == true)
        XCTAssert(callCount == 1)
        XCTAssert(cached(in: &cache, compute) == true)
        XCTAssert(callCount == 1)

        callCount = 0

        XCTAssert(cached(in: &parameterizedCache[true], { compute(true) }) == true)
        XCTAssert(cached(in: &parameterizedCache[false], { compute(false) }) == false)
        XCTAssert(callCount == 2)
        XCTAssert(cached(in: &parameterizedCache[true], { compute(true) }) == true)
        XCTAssert(cached(in: &parameterizedCache[false], { compute(false) }) == false)
        XCTAssert(callCount == 2)

        // 🇩🇪

        cache = nil
        callCount = 0

        XCTAssert(zwischengespeichert(in: &cache, compute) == true)
        XCTAssert(callCount == 1)
        XCTAssert(zwischengespeichert(in: &cache, compute) == true)
        XCTAssert(callCount == 1)

        // 🇫🇷

        cache = nil
        callCount = 0

        XCTAssert(mis(enCache: &cache, compute) == true)
        XCTAssert(callCount == 1)
        XCTAssert(mis(enCache: &cache, compute) == true)
        XCTAssert(callCount == 1)
    }

    static var allTests: [(String, (SDGCachingTests) -> () throws -> Void)] {
        return [
            ("testCaching", testCaching)
        ]
    }
}
