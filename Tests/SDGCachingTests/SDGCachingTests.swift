// SDGCachingTests.swift
//
// This source file is part of the SDGCaching open source project.
//
// Copyright ©2016 Jeremy David Giesbrecht and the SDGCaching contributors.
//
// Soli Deo gloria
//
// Licensed under the Apache License, Version 2.0
// See http://www.apache.org/licenses/LICENSE-2.0 for licence information.

import XCTest
@testable import SDGCaching

class SDGCachingTests: XCTestCase {
    
    func testCaching() {
        
        var callCount = 0
        func compute() -> Bool {
            callCount += 1
            return true
        }
        func compute(parameter: Bool) -> Bool {
            callCount += 1
            return parameter
        }
        
        var cache: Bool?
        var parameterizedCache: [Bool: Bool] = [:]
        
        XCTAssert(cachedResult(cache: &cache, computation: compute) == true)
        XCTAssert(callCount == 1)
        XCTAssert(cachedResult(cache: &cache, computation: compute) == true)
        XCTAssert(callCount == 1)
        
        callCount = 0
        
        XCTAssert(cachedResult(cache: &parameterizedCache, parameter: true, computation: compute) == true)
        XCTAssert(cachedResult(cache: &parameterizedCache, parameter: false, computation: compute) == false)
        XCTAssert(callCount == 2)
        XCTAssert(cachedResult(cache: &parameterizedCache, parameter: true, computation: compute) == true)
        XCTAssert(cachedResult(cache: &parameterizedCache, parameter: false, computation: compute) == false)
        XCTAssert(callCount == 2)
    }
    
    
    static var allTests : [(String, (SDGCachingTests) -> () throws -> Void)] {
        return [
            ("testCaching", testCaching),
        ]
    }
}
