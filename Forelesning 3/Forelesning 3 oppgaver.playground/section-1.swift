import Foundation

// OPPGAVE 1
// Bruk matrise stuct'en under og lag et subscript for å hente ut og sette verdier i matrisen. Verdien du skal hente ut og sette er en Double.
/*
struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 0
matrix[1, 0] = 1
matrix[0, 1] = 2
matrix[1, 1] = 3

matrix // prints [0.0, 2.0, 1.0, 3.0]
*/

struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            return grid[(row * columns) + column]
        }
        set(newValue) {
            grid[(row * columns) + column] = newValue
        }
        
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 0
matrix[1, 0] = 1
matrix[0, 1] = 2
matrix[1, 1] = 3

matrix // prints [0.0, 2.0, 1.0, 3.0]

// OPPGAVE 2
// Svar på hvorfor kompilatoren feiler når du limer inn klassen uten kontruktør? Svar: Fordi variablene må initialiseres, de er nemlig ikke optionals eller har default verdi.
// Lag en designated konstruktør og en convenience kontruktør for denne klassen
// Lag nye instanser av klassen ved hjelp av de to kontruktørene du lagde i oppgave 2.2
/*
class Time {
    var hour: Int
    var minute: Int
    var second: Int

    var running: Bool = false
    var startedAt: NSDate?
    var stoppedAt: NSDate?
}
*/

class Time {
    var hour: Int
    var minute: Int
    var second: Int
    
    var running: Bool = false
    var startedAt: NSDate?
    var stoppedAt: NSDate?
    
    init(hour: Int, minute: Int, second: Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    convenience init() {
        self.init(hour: 0, minute: 12, second: 30)
    }
}

var time1 = Time(hour: 10, minute: 20, second: 30)
var time2 = Time()

// OPPGAVE 3
// 1. Lag en base klasse Animal, der du finner måter å bruke final og required som beskrevet i slidene
// 2. Lag en metode for å sove, en metode for å lage en lyd med println og en metode for å spise
// 3. Lag deretter en subclass, for eksempel Bird som arver av base klassen Animal
// 4. Bruk override for å skrive over base klassen funksjonaliteten
// 5. Lag en subclass til som arver av Animal base klassen
// 6. Lag en array med begge subklassene og foreach over dem,
// 7. Identifiser hva slags type det er og skriv det ut ved hjelp av println

class Animal {
    let type: String
    var description: String {
        return "Jeg er et dyr."
    }
    
    required init(type: String) {
        self.type = type
    }
    
    final func sleep() {
        print("SLEEP")
    }
    
    func makeSound() {
        println("SOUND")
    }
    
    func eat() {
        println("EAT")
    }
}

class Bird : Animal {
    override var description: String {
        return "Jeg er en fugl."
    }
}

class Dog : Animal {
    override var description: String {
        return "Jeg er en hund."
    }
}

var animalArray: [Animal] = [Bird(type: "ørn"), Dog(type: "golden retriever")]

for animal in animalArray {
    if animal is Bird {
        println("Dyret (\(animal.type)) er en fugl")
    } else if animal is Dog {
        println("Dyret (\(animal.type)) er en hund")
    }
}

// OPPGAVE 4
// Lag det som er nødvendig for at denne if statementen fungerer
// Lag et eksempel på begge utfall av if
/*
if let street = westerdals.students?.first?.address?.street {
    println("Studenten bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
}
*/

class Address {
    var street: String
    var zipCode: String
    var postalPlace: String
    
    init(street: String, zipCode: String, postalPlace: String) {
        self.street = street
        self.zipCode = zipCode
        self.postalPlace = postalPlace
    }
}

class Student {
    var firstName: String
    var lastName: String
    var address: Address?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

}

class Skole {
    var students: [Student]?
}

var westerdals = Skole()

if let street = westerdals.students?.first?.address?.street {
    println("Studenten bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
}

var address = Address(street: "Maridalsveien 33L", zipCode: "0175", postalPlace: "Oslo")
var student = Student(firstName: "Øyvind", lastName: "Midtbø")

student.address = address
westerdals.students = [student]

if let street = westerdals.students?.first?.address?.street {
    println("Studenten bor i \(street).")
} else {
    println("Kunne ikke hente gatenavn")
}

// OPPGAVE 5
// Lag det som er nødvendig for at denne if statementen fungerer
/*
if westerdals.students?.first?.address?.printStreet() != nil {
    println("Det gikk bra å kalle print funksjonen")
} else {
    println("Jeg kunne ikke kalle metoden")
}
*/

class Address2 {
    var street: String
    var zipCode: String
    var postalPlace: String
    
    init(street: String, zipCode: String, postalPlace: String) {
        self.street = street
        self.zipCode = zipCode
        self.postalPlace = postalPlace
    }
    
    func printStreet() {
        println("Gaten er \(street)")
    }
}

class Student2 {
    var firstName: String
    var lastName: String
    var address: Address2?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

class Skole2 {
    var students: [Student2]?
}

var westerdals2 = Skole2()
var address2 = Address2(street: "Maridalsveien 33L", zipCode: "0175", postalPlace: "Oslo")
var student2 = Student2(firstName: "Øyvind", lastName: "Midtbø")

student2.address = address2
westerdals2.students = [student2]

if westerdals2.students?.first?.address?.printStreet() != nil {
    println("Det gikk bra å kalle print funksjonen")
} else {
    println("Jeg kunne ikke kalle metoden")
}