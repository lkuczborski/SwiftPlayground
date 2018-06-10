//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
//:> ## For "i" For In / Break Continue / Do

let tablica = ["💩", "😎", "🍻"]
let slownik = ["💩" : "kupka", "😎" : "luzak", "🍻" : "browar"]
let zakres  = -1...1
let liczby  = [1, 2, 3];

//: ### For
//: Od Swift 3.0 `for` taki jak w `C` nie istnieje. To było szybkie ;)

//: ### For In

for i in slownik {
    i
}

//: Troszeczkę na siłę ale kto nam zabroni...
for index in (0..<liczby.count).reversed() {
    liczby[index]
}

//: jeżeli chcemy zignorować "index" to możeny to zrobić

for _ in 0..<3 {
    print("Niebo w ziemi. -- Wiesław Wszywska");
}

//: stride - ang. krok

for i in stride(from: 0, to: 9, by: 3) {
    i
}

for i in stride(from: 0, through: 9, by: 3) {
    i
}

for i in stride(from: 3, to: 0, by: -1) {
    i
}

for (klucz, wartosc) in slownik {
    "klucz: \(klucz)\twartosc: \(wartosc)"
}

for literka in "Niebo w ziemi".enumerated() {
    type(of: literka)
    print(literka)
}

//: Dodatkowe wymagania moga byc narzucone przy pomocy pattern machingu.

for i in -3...3 where i > 0 {
    i
}

//: ## Break Continue

for wartosc in 0...10 {
    if wartosc > 2 && wartosc < 8 {
        break
    }

    print("[break] Wartosc: \(wartosc)")
}

for wartosc in 0...10 {
    if wartosc % 2 == 0 {
        continue
    }

    print("[continue] Wartosc: \(wartosc)")
}


//: ## Labelki Na Pętlach

labelkaSekcji: for sekcja in 0...100_000_000 {
    labelkaWiersza: for wiersz in 0...10 {
        print("sekcja: \(sekcja) wiersz: \(wiersz)")

        if wiersz > 0 {
            break labelkaSekcji
        }
    }
}

//: ### [do](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Statements.html#//apple_ref/doc/uid/TP40014097-CH33-ID533) {}
//: Wprowadza nowy "zakres" (scope) i może opcjonalnie zawierać sekcje __catch__.

var index = 0

start: do { // <-- nowy scope
    index += 1
    index

    do { // <-- wewnetrzny scope
        if index < 3 {
            continue start
        }
    }
}

print("")

var zabezpiecznieie = 0

start2: repeat {
    zabezpiecznieie += 1

    for i in 0...30 {
        print(i)
        if i > 3 {
            break start2
        }
    }

    "tu nigdy nie dojdzie z podana labelka petli..."

    print(zabezpiecznieie)
    if zabezpiecznieie > 100 {
        break //
    }
} while true

//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
