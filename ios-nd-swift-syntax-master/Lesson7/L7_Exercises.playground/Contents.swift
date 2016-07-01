//: ## Lesson 7 Exercises - Enums & Structs

//: __Problem 1__
//:
//: At the end of the code snippet below, what is the value of macchiato.steamedMilk when EspressoDrink is implemented as a struct? What about when EspressoDrink is implemented as a class?
enum Amount {
    case None
    case Splash
    case Some
    case Alot
}

struct EspressoDrink {
    let numberOfShots: Int
    var steamedMilk: Amount
    let foam: Bool
    
    init(numberOfShots: Int, steamedMilk: Amount, foam: Bool) {
        self.numberOfShots = numberOfShots
        self.steamedMilk = steamedMilk
        self.foam = foam
    }
}

var macchiato = EspressoDrink(numberOfShots: 2, steamedMilk: .None, foam: true)
var espressoForGabrielle = macchiato
espressoForGabrielle.steamedMilk = .Splash
macchiato.steamedMilk

// 1
// It will be .None if implemented as a struct, but .splash if implemented as a Clash
//: __Problem 2__
//:
//: __2a.__
//: Write an enum to represent the five fingers on a human hand.

enum Finger: Int {
    case Thumb, Index,  Middle,  Wedding, Pinky
}

//:
//: __2b.__
//: Associate an Int value with each finger.

//: __Problem 3__

//: Uncomment the code below and choose whether each type should be an enum, class, or struct.
struct Window {
    let height: Double
    let width: Double
    var open: Bool
}

enum WritingImplement {
    case Pen
    case Pencil
    case Marker
    case Crayon
    case Chalk
}
struct  Material {
    let name: String
    let density: Double
    let stiffness: Double
}


struct Bicycle {
    let frame: Material
    let weight: Double
    let category: String

    static var bikeCategories: [String] = ["Road", "Touring", "Mountain", "Commuter", "BMX"]

    func lookCool() {
        print("Check out my gear-shifters!")
    }
}

class Cyclist {
    var speed: Double
    let agility: Double
    let bike: Bicycle

    var maneuverability: Double {
        get {
            return agility - speed / 5
        }
    }

    init(speed: Double, agility: Double, bike: Bicycle) {
        self.speed = speed
        self.agility = agility
        self.bike = bike
    }

    func brake() {
        speed -= 1
    }

    func pedalFaster(factor: Double) {
        speed * factor
    }
}

enum Size: String {
    case Small = "8 ounces"
    case Medium = "12 ounces"
    case Large = "16 ounces"
}

//: __Problem 4__
//:
//: Write a cookie struct.

struct Cookie {
    
    let flavor = "Chocolate"
    var minutesSinceRemovedFromOven = 6
    
    var delicious: Bool {
        get {
            if self.flavor == "Chocolate" && self.minutesSinceRemovedFromOven < 10 {
                return true
            }
            return false
        }
    }
    
    func tempt() {
        if delicious {
            print("Please eat me now.")
        }
    }
    
}

let bestCookie = Cookie()
bestCookie.tempt()
bestCookie.delicious
//:
//: __4a.__
//: Include 2 stored properties. Examples might include a string representing flavor, or an int representing minutesSinceRemovalFromOven.

//:__4b.__
//: Add a computed property, "delicious", a bool whose value depends upon the values of the stored properties.

//:__4c.__
//:Include a method. For example, the method tempt() might return or print out an indication of a person being tempted to eat the cookie.

//: __4d.__
//: Create an instance of your Cookie struct and call its method.

//: __Problem 5__
//:
//: Write a class to represent a listing for a Bed and Breakfast.
//:
//: __5a.__
//: Include 3 stored properties. Examples might include a category representing the type of housing i.e. apartment or house, or a bool representing availability.
enum Housing {
    case Apartment, House, Hostel
}
class BnBListing {
    
    let category: Housing
    var availability: Bool
    let AirBnBRating: Int
    
    init(category: Housing, availability: Bool, AirBnBRating: Int) {
        self.category = category
        self.availability = availability
        self.AirBnBRating = AirBnBRating
    }
    
    func book() {
        if AirBnBRating >= 4 {
            print("Congrats you're so lucky")
            availability = true
        } else {
            print("Sorry we're overbooked! Try booking earlier")
            availability = false

        }
    }
}

let urbanpack = BnBListing(category: .Hostel, availability: true, AirBnBRating: 3)
urbanpack.book()
//: __5b.__
//: Consider writing a helper enum and incorporating it as one of your properties.

//: __5c.__
//: Include at least one method. For example, the method book() might toggle the availability bool or return a reservation confirmation.

//: __5d.__
//: Create an instance of your BnBListing class and call one of its methods.
