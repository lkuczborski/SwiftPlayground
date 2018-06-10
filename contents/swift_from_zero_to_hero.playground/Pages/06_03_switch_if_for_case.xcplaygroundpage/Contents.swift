//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
//:> ## Switch / If Case oraz For Case / Optional binding / Optional Pattern Matching
import Foundation

extension Dictionary where Value : Equatable {
    func allKeysForValue(_ val : Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}

let kosci = [1: "⚀", 2: "⚁", 3: "⚂", 4: "⚃", 5: "⚄", 6: "⚅"]
kosci.count

var kosc1 = kosci[Int(arc4random_uniform(UInt32(kosci.count)) + 1)]
var kosc2 = kosci[Int(arc4random_uniform(UInt32(kosci.count)) + 1)]

kosci.allKeysForValue(kosc1!).first!
kosci.allKeysForValue(kosc2!).first!

//: ### Switch

switch (kosc1!, kosc2!) {

//default:
    //    break // 💥

case ("⚀", "⚀"): // (1, 1)
    fallthrough

case ("⚅", "⚅"): // (6, 6)
    "30 punktow"

case ("⚀"..."⚁", "⚀"..."⚁"): // (1...2, 1...2)
    "16 punktow"

    // wartosc1 + wartosc2 == 7
case _ where kosci.allKeysForValue(kosc1!).first! + kosci.allKeysForValue(kosc2!).first! == 7:
    "5 punktow"

    // wartosc1 == wartosc2
case (_, _) where kosc1! == kosc2!:
    let wartosc = kosci.allKeysForValue(kosc2!).first!

    switch wartosc * 2 {
    case 4, 10:
        "8 punktow"
    default:
        "10 punktow"
    }

default: // musi byc ostatnie
    let wartosc1 = kosci.allKeysForValue(kosc1!).first!
    let wartosc2 = kosci.allKeysForValue(kosc2!).first!

    "\(wartosc1 + wartosc2) punktow"
  break
}

//: Można też __switchować__ po klasach

class Pierwsza {}
class Druga    { var licznik = 42 }
class Trzecia  { var temperatura = 24 }

var jakasInstancja: AnyObject = Trzecia()

switch jakasInstancja {

//: __podłoga__ jeżeli nie potrzebuje odwołać się do zmiennej
case _ as Pierwsza: 
    "pierwsza"

case let typ as Druga:
    type(of: typ)
    typ.licznik

case let typ as Trzecia:
    typ.temperatura
    typ.temperatura = 69
    typ.temperatura

default:
    break;
}

jakasInstancja.description


//: ### If Case oraz For Case
enum Opcje {
    case calkowita(Int)
    case zmiennoPrzecinkowa(Double)
    case textowa(String)
}

let jakasClakowita = Opcje.calkowita(42)

//: W sytuacji gdy chcemy coś zrobic z saną stałą/zmienną możemy wykorzystać __switch__

switch jakasClakowita {
case .calkowita(let calkowita):
    "Hura dla całkowitej \(calkowita)"
case .zmiennoPrzecinkowa:
    break
case .textowa:
    break;
}

// można też nieco to skrócić i zapisać tak:

switch jakasClakowita {
case .calkowita(let calkowita):
    "Hura dla całkowitej \(calkowita)"

default:
    break;
}

//: #### if case

if case .calkowita(let liczbaCalkowita) = jakasClakowita {
     "Hura dla całkowitej \(liczbaCalkowita)"
}

if case .calkowita(let liczbaCalkowita) = jakasClakowita , liczbaCalkowita > 40 {
    "Hura dla całkowitej \(liczbaCalkowita)"
}

//: #### for case
let jakiesOpcje: [Opcje] = [ .calkowita(42), .zmiennoPrzecinkowa(6.9), .textowa("sto"), .calkowita(69)]

for opcja in jakiesOpcje {
    switch opcja {
    case .calkowita(let liczbaCalkowita):
        "Hura dla całkowitej \(liczbaCalkowita)"
    default:
        break
    }
}

for case .calkowita(let liczbaCalkowita) in jakiesOpcje {
    "Hura dla całkowitej \(liczbaCalkowita)"
}

//: podobnie jak wczesniej możeby dodatkowo zacieśniać zakres ktory nas interesuje przy pomocy słowa kluczowego __where__
for case .calkowita(let liczbaCalkowita) in jakiesOpcje where liczbaCalkowita < 69 {
    "Hura dla całkowitej \(liczbaCalkowita)"
}

let procentAlko: Int? = 40

//: #### Optional binding
if let procent = procentAlko , procent >= 34 {
    "Można pić bez obawień"
}

//: #### [Optional pattern matching](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Patterns.html#//apple_ref/doc/uid/TP40014097-CH36-ID520)
if case let procent? = procentAlko , procent >= 34 { // bez '?` będzie Int?
     "Można pić bez obawień"
    type(of: procent)
}

let procenty: [Int?] = [42, nil, 5, nil, 12]

for case let procent? in procenty where procent > 5 {
    procent
}

//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
