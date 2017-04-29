<!--
 🇩🇪DE Lies mich.md

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

SAPs: [macOS](https://sdggiesbrecht.github.io/SDGCaching/macOS) • [Linux](https://sdggiesbrecht.github.io/SDGCaching/Linux) • [iOS](https://sdggiesbrecht.github.io/SDGCaching/iOS) • [watchOS](https://sdggiesbrecht.github.io/SDGCaching/watchOS) • [tvOS](https://sdggiesbrecht.github.io/SDGCaching/tvOS)

# SDGCaching

**⚠ Dieses Projekt ist veraltet. Es wurde von [SDGCornerstone](https://github.com/SDGGiesbrecht/SDGCornerstone) abgelöst. ⚠**

SDGCaching („SDGZwischenspeichern“) automatisiert das Zwischenspeichern für Ergebnisse aufwendigen Funktionen.

> [רַק הִשָּׁמֶר לְךָ וּשְׁמֹר נַפְשְׁךָ מְאֹד פֶּן־תִּשְׁכַּח אֶת־הַדְּבָרִים אֲשֶׁר־רָאוּ עֵינֶיךָ וּפֶן־יָסוּרוּ מִלְּבָבְךָ כֹּל יְמֵי חַיֶּיךָ וְהוֹדַעְתָּם לְבָנֶיךָ וְלִבְנֵי בָנֶיךָ׃<br>Nur hüte dich und bewahre deine Seele sehr, dass du die Dinge nicht vergisst, die deine Augen gesehen haben, und dass sie nicht aus deinem Herzen weichen alle Tage deines Lebens. Gib sie deinen Kindern und Kindeskindern bekannt.](https://www.biblegateway.com/passage/?search=Deuteronomy+4&version=WLC;SCH2000)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;―‎משה/Moshe

## Merkmale

(Die deutsche APS wurde noch von kein Muttersprachler überprüft und könnte Rechtschreibungsfehler beinhalten. [Verbesserungsvorschläge](https://github.com/SDGGiesbrecht/SDGCaching/issues) sind willkommen.)

- Automatisiertes Zwischenspeichern für Ergebnisse aufwendigen Funktionen durch `zwischengespeichert(in::)`.

(Für eine Liste verwandter Projekte, siehe [hier](🇩🇪DE%20Verwandte%20Projekte.md).) <!--Skip in Jazzy-->

## Einführung

SDGCaching ist für den Einsatz mit dem [Swift Package Manager](https://swift.org/package-manager/) vorgesehen.

Fügen Sie SDGCaching einfach in der Abhängigkeitsliste in `Package.swift` hinzu:

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

Dann kann SDGCaching in Quelldateien eingeführt werden:

```swift
import SDGCaching
```

## Verwendungsbeispiel

```swift
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
```

## Über

Das SDGCaching‐Projekt wird von Jeremy David Giesbrecht erhalten.

Wenn SDGCaching Ihnen Geld sparrt, denken Sie darüber, etwas davon zu [spenden](https://paypal.me/JeremyGiesbrecht).

Wenn SDGCaching Inhen Zeit sparrt, denken Sie darüber, etwas davon zu gebrauchen, um zum Projekt [beizutragen](https://github.com/SDGGiesbrecht/SDGCaching).

> [Ἄξιος γὰρ ὁ ἐργάτης τοῦ μισθοῦ αὐτοῦ ἐστι.<br>Denn der Arbeiter ist seines Lohns würdig.](https://www.biblegateway.com/passage/?search=Luke+10&version=SBLGNT;SCH2000)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;―‎ישוע/Yeshuʼa
