// Caching.swift
//
// This source file is part of the SDGCaching open source project.
//
// Copyright ©2016–2017 Jeremy David Giesbrecht and the SDGCaching contributors.
//
// Soli Deo gloria
//
// Licensed under the Apache License, Version 2.0
// See http://www.apache.org/licenses/LICENSE-2.0 for licence information.

// MARK: - Caching

/// If `cache` is non‐`nil`, its contents are immediately returned; if `cache` is `nil`, the result of `computation` is evaluated, returned, and stored in `cache` for future calls.
///
/// - Parameters:
///     - cache: The variable in which to cache the result. Declare it in the appropriate scope for the desired cache lifetime. The cache can be refreshed at any time by setting it to `nil` elsewhere.
///     - computation: The computation to be evaluated.
///
/// - Returns: The result of `computation`.
public func cachedResult<Result>(cache: inout Result?, computation: () throws -> Result) rethrows -> Result {
    if let result = cache {
        return result
    } else {
        let result = try computation()
        cache = result
        return result
    }
}

/// If `cache[parameter]` is non‐`nil`, its contents are immediately returned; if `cache[parameter]` is `nil`, the result of `computation` is evaluated, returned, and stored in `cache[parameter]` for future calls.
///
/// - Parameters:
///     - cache: A dictionary in which to cache the results. Declare it in the appropriate scope for the desired cache lifetime. The cache can be refreshed at any time by setting it to `[:]` elsewhere.
///     - parameter: A parameter to use in `computation`.
///     - computation: The computation to be evaluated.

/// - Returns: The result of `computation(parameter)`.
public func cachedResult<Parameter, Result>(cache: inout [Parameter: Result], parameter: Parameter, computation: (Parameter) throws -> Result) rethrows -> Result {
    return try cachedResult(cache: &cache[parameter]) { try computation(parameter) }
}
