/*
 LisezMoi.swift

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 */

// [_Define Example: Read‐Me: fr-FR_]
import SDGCaching

// Cet exemple utilise SDGCaching pour mettre en cache des attributs calculés d’une structure.

private struct Nombre {

    // MARK: - Initialisation

    init(valeur: Int) {
        self.valeur = valeur
    }

    // MARK: - Attribut stocké

    var valeur: Int {
        willSet {
            // Vider la cache quand la valeur est changée.
            cache = Cache()
        }
    }

    // MARK: - Cache

    private class Cache {
        var carré: Int?
        var puissances: [Int: Int] = [:]
    }
    private var cache = Cache()

    // MARK: - Attributs calculés

    // Ceux‐ci ne serai exécutés qu’une fois pendent que l’attribut valeur reste inchangé.
    // Quand l’attribut valeur est modifié, ils seront réexécutés la prochaine fois qu’ils soient utilisés.

    var carré: Int {
        return mis(enCache: &cache.carré) {

            var résultat = 0
            for _ in 1 ... valeur {
                résultat += valeur
            }
            return résultat
        }
    }

    func élevé(à exposant: Int) -> Int {

        // Ceci utilise un dictionnaire pour séparer la cache pour chaque exposant.
        return mis(enCache: &cache.puissances[exposant]) {

            var résultat = 0
            for _ in 1 ... exposant {
                for _ in 1 ... valeur {
                    résultat += valeur
                }
            }
            return résultat
        }
    }
}
// [_End_]
