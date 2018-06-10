//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
//:> ## While / Repeat While / If / If Else / If Let / Guard

import Foundation

//: ### While
//: Jeżeli warunek nie jest spełniony to może się okazać, że kod wewnątrz nie zostanie wykonany ani razu.

while arc4random_uniform(6) + 1 != 1 || arc4random_uniform(6) + 1 != 1 {
    print(".", terminator: "")
}

print("")

//: ### Repeat-While
//: Znaczenie słowa kluczowego __do__ zostało zmienione dlatego ta pętla teraz się tak nazywa.

let kosci = [1: "⚀", 2: "⚁", 3: "⚂", 4: "⚃", 5: "⚄", 6: "⚅"]

var a = 0
var b = 0

repeat {
    a = Int(arc4random_uniform(6) + 1)
    b = Int(arc4random_uniform(6) + 1)

    print("\(kosci[a]!) \(kosci[b]!)")
} while a != 1 || b != 1

print("Ostatnie: \(kosci[a]!) \(kosci[b]!)")


//: ### If - If Else
let wynikTestu = Int(arc4random_uniform(50) + 50)

if wynikTestu >= 80 {

    if wynikTestu < 85 {
        "dobra robota"
    } else if wynikTestu < 90 {
        "wysmienicie"
    } else if wynikTestu < 95 {
        "niesamowite"
    }
    else {
        "wybitnie!"
    }
} else {
    "jednak nie zdales"
}

//: [#available](https://www.hackingwithswift.com/new-syntax-swift-2-availability-checking) Big Nerd Ranch -> [klik](https://www.bignerdranch.com/blog/hi-im-available/)
if #available(iOS 9, OSX 10.0, watchOS 2.0, *) {
    "Można użyć API"
} else {
    "Nie można użyć API"
}

//: ### if let oraz __optional binding__
//: Dzięki __optional binding__ możemy sprawdzić czy jakaś opcjonalna zmienna ma wartość (nie jest nil) i ją "odwinąć". 

var bycMozeCytat: String?
var zPewnosciaCytat: String? = "Można pić bez obawień."

if let bycMozeCytat = bycMozeCytat { // shadowing
    bycMozeCytat
} else {
    "jednak nil"
}

if let _ = zPewnosciaCytat {
    "😎"
}

//: Im więcej tym weselej ;)

var imie    :String? = "Wiesław"
var nazwisko:String? = "Wszywka"

if let imie = imie, let nazwisko = nazwisko {
    imie + " " + nazwisko.uppercased()
}

imie = nil
nazwisko = nil

if let imie = imie, let nazwisko = nazwisko {
    imie + " " + nazwisko
} else {
    "czegoś zabrakło"
}

//: ### Guard
//: W działaniu bardzo podobne do __if__. Z tą różnicą, że kod w klamerkach zostanie wykonany jeżeli wynik wyrażenia guard == false. Dodatkowo ostatnim wyrażeniem musi zmieniać ścieżkę wykonania programu.

for i in 0...100 {
    guard  i >= 50 else {
        continue
    }
    guard i <= 55 else {
        break
    }

    i
}

func przyjmujeOptionala(_ bycMozeTekst:String?) {
    guard let naPewnoTekst = bycMozeTekst else {
        "nie bylo tekstu :("
        return
    }

    naPewnoTekst // stala z guard jest dalej dostepna
}

przyjmujeOptionala(nil)
przyjmujeOptionala("Niebo w ziemi")

//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
