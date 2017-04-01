/*
 Caching.swift

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2016–2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 */

// MARK: - 🇬🇧🇺🇸🇨🇦 Caching • 🇩🇪 Zwischenspeichern • 🇫🇷 Mise en cache

/// Returns the result of `computation`, using caching to improve efficiency upon repeated use.
///
/// This is accomplished by either...
///
/// - retrieving a previous result from `cache` (if `cache` is non‐`nil`), or
/// - executing `computation` and saving the result to `cache` before returning it.
///
/// - Parameters:
///     - cache: The variable in which to cache the result. Declare it in the appropriate scope for the desired cache lifetime. The cache can be refreshed at any time by setting it to `nil`.
///     - computation: The computation to be evaluated.
///
/// - Returns: The result of `computation`.
public func cached<Result>(in cache: inout Result?, _ computation: () throws -> Result) rethrows -> Result {
    if let result = cache {
        return result
    } else {
        let result = try computation()
        cache = result
        return result
    }
}

/// Gibt das Ergebnis von `berechnung` zurück, in dem einen Zwischenspeicher verwendet wird, um die Leistung bei Wiederholungen zu erhöhen.
///
/// Das wird erreicht, in dem entweder ...
///
/// - ein früheres Ergebnis aus dem Zwischenspeicher geholt wird (wenn `zwischenspeicher` nicht `nul` ist), oder
/// - `berechnung` ausgeführt wird, und das Ergebnis zu `zwischenspeicher` gespeichert und zurückgegeben wird.
///
/// - Parameters:
///     - zwischenspeicher: Die Variable, in dem das Ergebnis zwischengespeichert werden soll. Definiere sie in dem Sichtbarkeitsbereich, der die gewünschte Lebensdauer für den Zwischenspeicher entspricht. Der Zwischenspeicher kann jederzeit entleert werden, in dem man ihn auf `nil` setzt.
///     - berechnung: Die Berechnung, die ausgeführt werden soll.
///
/// - Returns: Das Ergebnis von `berechnung`.
public func zwischengespeichert<Ergebnis>(in zwischenspeicher: inout Ergebnis?, _ berechnung: () throws -> Ergebnis) rethrows -> Ergebnis {
    return try cached(in: &zwischenspeicher, berechnung)
}

/// Retourne le résultat de `calcul`, en utilisant une cache pour améloirer l’efficacité en case de répétition.
///
/// Ceci est accompli, soit en...
///
/// - retirant le résultat précédent de `cache` (si `cache` est non‐`nil`), ou
/// - exécutant `calcul` et enregistrant le résultat dans `cache` avant de le retourner.
///
/// - Parameters:
///     - cache: La variable dans lequel le résultat devrait être mis. Déclarez‐la dans la portée appropriée pour la durée de vie désirée. La cache peut être réinitialisée, n’importe quand, en la remettant à `nil`.
///     - calcul: Le calcul à évaluer.
///
/// - Returns: Le résultat de `calcul`.
public func mis<Résultat>(enCache cache: inout Résultat?, _ calcul: () throws -> Résultat) rethrows -> Résultat {
    return try cached(in: &cache, calcul)
}
