/*
 Obsolete.swift

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2016–2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 */

// MARK: - cached(in::)

@available(*, unavailable, renamed: "cached")
public func cachedResult<Result>(cache: inout Result?, computation: () throws -> Result) rethrows -> Result {
    fatalError()
}

@available(*, unavailable, message: "Use “cached(in: &cache[parameter], computation)” instead.")
public func cachedResult<Parameter, Result>(cache: inout [Parameter: Result], parameter: Parameter, computation: (Parameter) throws -> Result) rethrows -> Result {
    fatalError()
}
