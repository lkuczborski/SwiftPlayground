//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
//:> ## [Operatory](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html) (arytmetyczne, porównanie, rzutowanie, zakresy)

import UIKit
//: ## Operatory Arytmetyczne

2 + 3
2 - 3
2 * 3
2 / 3 // -> Int
2 / 3.0

var mniejszeZlo = 665
mniejszeZlo += 1
mniejszeZlo -= 1
mniejszeZlo

var a = 6.9
a -= 1
a += 1
a

var b = 2
b += 3
b -= 3
b *= 3
b /= 3

10 % 9
10 % -9
-10 % 9
-10 % -9

//: Miła niespodzianka "modulo" działa też na liczbach zmiennoprzecinkowych.
10.5.truncatingRemainder(dividingBy: 9)

//: ### Przepełnienia / Overflow

var intMax : UInt8 = UInt8.max
String(intMax, radix: 2)
//intMax + 1 // 💥
intMax &+ 1

var intMin : Int8 = Int8.min
String(intMin, radix: 2)
intMin &- 1

var intJakis : UInt8 = 160
intJakis &* 2

//: Jak już było pokazane w rozdziale o stringach operator + możemy też i dla nich zastosować.

"Lorem" + " " + "ipsum"

//: Tablice też...

[1,2,3] + [4, 5, 6]

//: ### Porównania i operatory logiczne

let intA = 2
let intB = 6
var intJakisInny = intA

let klasaA = Wartosc()
let klasaB = Wartosc()
let klasaJakas = klasaA

klasaA.wartosc
klasaB.wartosc

intA == intJakisInny // czy ta sama wartosc
intA != intB

klasaA == klasaB // czy obiekty sa rowne 'func ==' // inny kolor i można nadusić z altem dla opisu
klasaA === klasaB
klasaA === klasaJakas // czy ten sam obiekt

Unmanaged.passUnretained(klasaA).toOpaque()
Unmanaged.passUnretained(klasaJakas).toOpaque()
Unmanaged.passUnretained(klasaB).toOpaque()

var prawda = true
!prawda

//: Operatory logiczne sa ewaluowane od lewej do prawej. Dlatego lepiej te wymagające mniej obliczeń dać jako pierwsze.

// AND
true && true
true && false

// OR
true || true
true || false

//: ### Operator Trójargumentowy (test/warunek) ? TAK : NIE

let warunek = true
let cos = warunek ? "Warunek spełniony"
                  : "Warunek nie spełniony"

//: ### Nil Coalescing (Elvis ?:)

let domyslnaOdpowiedz = "Tak"
var danaOdpowiedz: String?

let ostatecznaOdpowiedz = danaOdpowiedz ?? domyslnaOdpowiedz // Taki 'Elvis' ?:

//: ## Zakresy (Range) -> Sekwencje Wartości
//: #### [Dodatek: Range](100-01_ranges)

for element in 0..<8 {
    element
}

let polOtwartyZakres = 0..<10
let zamknietyZakres  = 0...10

//polOtwartyZakres == zamknietyZakres // 💥
polOtwartyZakres == polOtwartyZakres
0..<44 == 0..<43

let dziwneCudo = ...42
print(dziwneCudo)
//: Stringi

var nowszyCytat = "Można pić bez obawień."

let poczatkowyIndex = nowszyCytat.index(nowszyCytat.startIndex, offsetBy: 6);
let koncowyIndex = nowszyCytat.index(poczatkowyIndex, offsetBy: 3)
let zakres = poczatkowyIndex..<koncowyIndex
type(of: zakres)

//for element in zakres { // 💥 no longer confors to Sequence protocol
//    element
//}

for indexOfLetter in nowszyCytat.indices[nowszyCytat.startIndex..<nowszyCytat.endIndex] {
    nowszyCytat[indexOfLetter]
}

// można też krócej
for indexOfLetter in nowszyCytat.indices[..<nowszyCytat.endIndex] {
    nowszyCytat[indexOfLetter]
}

for letter in nowszyCytat {
    print(letter)
}

nowszyCytat
nowszyCytat.replaceSubrange(zakres, with: "chlać")

//: Tablice

var liczby: [Int] = []
for index in 0..<5 {
    liczby += [index]
}
liczby

var doZastapienia = [11, 12, 13, 14, 15, 16]

let zakresDoZastapienia = (liczby.startIndex + 1) ..< (liczby.endIndex - 1) // 1..<4
liczby[zakresDoZastapienia]

liczby.replaceSubrange(zakresDoZastapienia, with: doZastapienia)

//: ## Rzutowanie

class Klasa1         { var property1 = 1 }
class Klasa2: Klasa1 { var property2 = "Wieslaw Wszywka" }
class Klasa3 {}

let k1 = Klasa1()
let k2 = Klasa2()

let tablica = [k1, k2]
type(of: tablica)

let pierwszyElement = tablica[0]
type(of: pierwszyElement)

pierwszyElement.property1

let drugiElement = tablica[1] // będzie typu Klasa1
type(of: drugiElement)
//drugiElement.property2 // 💥

drugiElement is Klasa2

// 'force cast' lub 'down cast'
let instancjaKlasy2 = drugiElement as! Klasa2 // sprawdzic bez !
instancjaKlasy2.property2

// 'upcast'

let klasa2UzywanaJakoKlasa1 = instancjaKlasy2 as Klasa1
type(of: klasa2UzywanaJakoKlasa1)

let tablicaRozmaitosci: [AnyObject] = [k1, k2, Klasa3()];
type(of: tablicaRozmaitosci)

let zdecydowanieInstancjaKlasy1 = tablicaRozmaitosci[0] as! Klasa1
let bycMozeInstancjaKlasy1 = tablicaRozmaitosci[1] as? Klasa1
type(of: bycMozeInstancjaKlasy1)
bycMozeInstancjaKlasy1?.property1

// rzutowanie inline
(tablicaRozmaitosci[1] as? Klasa2)?.property2

//: ## Operacje na Bitach

let jeden      = 0b1             // 00000001
let dwa        = jeden << 1      // 00000010
let cztery     = jeden << 2      // 00000100
let szesnascie = jeden << 4      // 00010000
let osiem      = szesnascie >> 1 // 00001000

let zero: UInt8 = 0b00000000    // 00000000
~zero                           // 11111111
String(~zero, radix: 2)
UInt8.max == ~zero

let binarnaA = 0b1100
let binarnaB = 0b1010
String(binarnaA, radix: 2)
String(binarnaB, radix: 2)

String(binarnaA & binarnaB, radix: 2)       // AND
String(binarnaA | binarnaB, radix: 2)       // OR
"0" + String(binarnaA ^ binarnaB, radix: 2) // XOR


// Bitmaska tak jak w Objective C
let opcja1 = 0b001
let opcja2 = 0b010
let opcja3 = 0b100
String(opcja1 | opcja2 | opcja3, radix: 2)

//: ## Kolejność wykonywania działań [Precedence and Associativity](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-ID41)

let wynik1: Double = 1 + (2 * 3 / 4).truncatingRemainder(dividingBy: 5)
let wynik2: Double = (1 + (((2 * 3) / 4).truncatingRemainder(dividingBy: 5)))

2 + 2 * 2
(2 + 2) * 2

//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)

