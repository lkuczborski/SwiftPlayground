//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
//:> ## Opóźnienie przypisania wartości do zmiennej oraz Optionale
import Foundation
//: ## Opóźnienie przypisania wartości do zmiennej
//: Można zadeklarować zmienną aby była jakiegoś typu natomiast przypisać jej wartość póżniej.

var cytat: String

//: error: variable 'cytat' used before being initialized
//print(cytat) // 💥

cytat = "Niebo w ziemi. -- Wiesław Wszywka"

//: Podobnie deklarując stałą przy użyciu słowa kluczowego **_let_** możemy przypisać wartość pózniej. Natomiast można to zrobić tylko raz!

let cytat2 : String
cytat2 = "I nie damy sobie wmówić, że białe jest białe a czarne jest czarne."
//: execution failed: immutable value 'cytat2' may only be initialized once ... note: change 'let' to 'var' to make it mutable
//cytat2 = "Sorry będziesz to jadł?" // 💥

//: ## Optionals
//: W pierwszym cytacie mamy mały wybuch 💥 z powodu chęci użycia zmiennej, która nie jest jeszcze zainicjowane lub ma vartość **`nil`**. Czasami natomiast potrzebujemy pracować ze zmiennymi które mogą jeszcze nie posiadać wartości. Swift posiada specjalną konstrukcje, która się nazywa **Optionals**. 
//: Optionala deklarujemy dodając `?` za nazwą typ np.
var bycMozeCytat: String?
type(of: bycMozeCytat)

var bycMozeCalkowita:Int?
type(of: bycMozeCalkowita)

//: Teraz możemy "używać" bezpiecznie takich zmiennych bez 💥
xrun("optional default value") {
    print(bycMozeCytat ?? "nie bylo wartosci")
    print(bycMozeCalkowita ?? "nie bylo wartosci")
}


//: Możemy sprawdzić czy string jest pusty
bycMozeCytat = ""
bycMozeCytat?.isEmpty
bycMozeCytat == nil

//: O `optionalach` można mysleć jak o pudełkach zawierających (lub nie) jakąś wartoś. Same w sobie nie są wartością (chociaż są bardzo użyteczne 😉) tylko "kontenerem" przechowującym tą wartość. Doskonale to widać gdy "wydrukujemy" zmienną która jest optionalem.
xrun("optional with value") {
    bycMozeCytat = "Sorry będziesz to jeść?"
    print(bycMozeCytat ?? "zabraklo wartosci")
}

//: Są takie momenty w życiu, że czegoś jesteśmy pewni na 100%. Podobnie czasami wiemy, że jakaś opcjonalna wartoś jest przechowywana w opcjonalnej zmiennej. Możemy ją wtedy "odwinąć" (force unwrap) i dostać ją bezpośrednio przy użyciu `!` za nazwą zmiennej.
print(bycMozeCytat!) // Dostajemy bezpośrednio przechowywaną wartość.
type(of: bycMozeCytat!)

//: Wyciągnąć zawartość możemy też w trakcie przypisywania do innej zmiennej/stałej.
var zPewnosciaCytat = bycMozeCytat!
type(of: zPewnosciaCytat)

//: Gdybyśmy jednak chcieli dostać się do zawartości optionala który jest pusty (nil) to w tym momencie dostaniemy wyjątek w runtime.
bycMozeCytat = nil
//: fatal error: unexpectedly found nil while unwrapping an Optional value
//zPewnosciaCytat = bycMozeCytat! // 💥

//:[ToC](00-00_toc) | [Tips and Tricks](900-00-tips_and_tricks) | [Previous](@previous) | [Next](@next)
