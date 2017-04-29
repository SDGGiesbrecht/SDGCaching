<!--
 🇫🇷FR Lisez moi.md

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

IPA : [macOS](https://sdggiesbrecht.github.io/SDGCaching/macOS) • [Linux](https://sdggiesbrecht.github.io/SDGCaching/Linux) • [iOS](https://sdggiesbrecht.github.io/SDGCaching/iOS) • [watchOS](https://sdggiesbrecht.github.io/SDGCaching/watchOS) • [tvOS](https://sdggiesbrecht.github.io/SDGCaching/tvOS)

# SDGCaching

**⚠ Ce projet est obsolète. Il était supplanté par [SDGCornerstone](https://github.com/SDGGiesbrecht/SDGCornerstone). ⚠**

SDGCaching (« SDGMiseEnCache ») automatise la mise en cache des résultats des fonctions complexes ou chronophages.

> [רַק הִשָּׁמֶר לְךָ וּשְׁמֹר נַפְשְׁךָ מְאֹד פֶּן־תִּשְׁכַּח אֶת־הַדְּבָרִים אֲשֶׁר־רָאוּ עֵינֶיךָ וּפֶן־יָסוּרוּ מִלְּבָבְךָ כֹּל יְמֵי חַיֶּיךָ וְהוֹדַעְתָּם לְבָנֶיךָ וְלִבְנֵי בָנֶיךָ׃<br>Seulement, prends garde à toi et veille attentivement sur ton âme, tous les jours de ta vie, afin de ne pas oublier les choses que tes yeux ont vu et de ne pas le laisser sortir de ton cœur. Enseigne‐le à tes enfants et aux enfants de tes enfants.](https://www.biblegateway.com/passage/?search=Deuteronomy+4&version=WLC;SG21)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;―‎משה/Moshe

## Fonctionnalités

(L’IPA française n’a pas encore été corrigée par un locuteur natif et peut contenir des fautes d’orthographe. Des [suggestions d’améloiration](https://github.com/SDGGiesbrecht/SDGCaching/issues) serait bienvenues.)

- Mise en cache automatisée des résultats des fonctions complexes ou chronophages par `mis(enCache::)`.

(Pour une liste de projets lié, voir [ici](🇫🇷FR%20Projets%20liés.md).) <!--Skip in Jazzy-->

## Importation

SDGCaching est prévu pour utilisation avec le [Swift Package Manager](https://swift.org/package-manager/).

Ajoutez SDGCaching simplement dans la liste des dépendances dans `Package.swift` :

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

Puis SDGCaching peut être importé dans des fichiers sources :

```swift
import SDGCaching
```

## Example d’utilisation

```swift
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
```

## À propos

Le projet SDGCaching est maintenu par Jeremy David Giesbrecht.

Si SDGCaching vous permet d’économiser de l’argent, considérez à en [donner](https://paypal.me/JeremyGiesbrecht).

Si SDGCaching vous permet d’économiser du temps, considérez à en utiliser à [contribuer](https://github.com/SDGGiesbrecht/SDGCaching) au projet.

> [Ἄξιος γὰρ ὁ ἐργάτης τοῦ μισθοῦ αὐτοῦ ἐστι.<br>Car le travailleur est digne de son salaire.](https://www.biblegateway.com/passage/?search=Luke+10&version=SBLGNT;SG21)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;―‎ישוע/Yeshuʼa
