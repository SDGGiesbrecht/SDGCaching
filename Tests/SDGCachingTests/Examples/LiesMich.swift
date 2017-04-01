/*
 LiesMich.swift

 This source file is part of the SDGCaching open source project.
 https://sdggiesbrecht.github.io/SDGCaching/macOS

 Copyright ©2017 Jeremy David Giesbrecht and the SDGCaching project contributors.

 Soli Deo gloria.

 Licensed under the Apache Licence, Version 2.0.
 See http://www.apache.org/licenses/LICENSE-2.0 for licence information.
 */

// [_Define Example: Read‐Me: de-DE_]
import SDGCaching

// Dieses Beispiel verwendet SDGCaching, um die berechneten Eigenschaften einer Struktur zwischenzuspeichern.

struct Zahl {

    // MARK: - Voreinstellung

    init(wert: Int) {
        self.wert = wert
    }

    // MARK: - Gespeicherte Eigenschaft

    var wert: Int {
        willSet {
            // Den Zwischenspeicher entleeren, wenn die „wert“‐Eigenschaft geändert wird.
            zwischenspeicher = Zwischenspeicher()
        }
    }

    // MARK: - Zwischenspeicher

    private class Zwischenspeicher {
        var quadrat: Int?
        var potenzen: [Int: Int] = [:]
    }
    private var zwischenspeicher = Zwischenspeicher()

    // MARK: - Berechnete Eigenschaften

    // Die Folgende werden nur einmal berechnet, solange die „wert“‐Eigenschaft ungeändert bleibt.
    // Wenn die „wert“‐Eigenschaft geändert wird, werden die Folgende bei Bedarf neuberechnet.

    var quadrat: Int {
        return zwischengespeichert(in: &zwischenspeicher.quadrat) {

            var ergebnis = 0
            for _ in 1 ... wert {
                ergebnis += wert
            }
            return ergebnis
        }
    }

    func hoch(_ exponent: Int) -> Int {

        // Hier wird ein Wörterbuch verwendet, um den Zwischenspeicher für verschiedenen Exponenten zu teilen.
        return zwischengespeichert(in: &zwischenspeicher.potenzen[exponent]) {

            var ergebnis = 0
            for _ in 1 ... exponent {
                for _ in 1 ... wert {
                    ergebnis += wert
                }
            }
            return ergebnis
        }
    }
}
// [_End_]
