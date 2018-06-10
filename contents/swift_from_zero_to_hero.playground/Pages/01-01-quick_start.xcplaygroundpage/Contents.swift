//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
//:> ## Quick start
/*:
> Playground - noun: a place where people can play
*/

import Foundation

let str = "Hello, playground"
NSLog(str)
print(str)

let str1 = "Lorem"; let str2 = "ipsum"
print(str1, str2)
print(str1, str2, separator: " -💩- ", terminator: "💥")

//: Playgroundy umożliwiają bardzo łatwe eksperymentowanie z kodem Swiftowym. Wystarczy coś napisać i automagicznie zostanie to skompilowane i uruchomione. Dodatkowo wyniki tych operacji można podglądać "na żywo" 👏🏻. Dodatkowo po kliknieciu prawym na takim podglądzie mamy 3 różne opcje do wyboru w zależności, która jest dla nas najbardziej interesująca 🍰
for i in 0..<36 {
    sin(Double(i) * 100)
}

let range = 20
for x in -range...range {
    2*x*x*x + 40 // 2x^3 + 40
}

for i in 0..<8 {
    _ = sin(Double(i) * 100)
}

for i in 0..<8 {
    sin(Double(i) * 100)
}

//: Jeżeli chcemy aby kod w palygroundzie wykonał sie raz jeszcze wystarczy, że zostanie naciśnięta ikonka **"play"** na dole edytora (przy konsoli) lub z menu *"Editor -> Execute Playground"*.

for _ in 0..<50 {
    arc4random_uniform(50)
}

//: Domyślnie playgroundy automagicznie kompilują i uruchamiają wpisany kod dosłownie po każdej zmianie. Jest to dość wygodne natomiast może być irytujące (szczególnie gdy tego kodu trochę jest). Można wyłączyć ten tryb przez dłuższe wciśnięcie i przutrzymanie ikonki **"play"** służącej do ponownego uruchomienia *"placu zabaw"*.

//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
