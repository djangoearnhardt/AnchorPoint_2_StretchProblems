//: [Properties](@previous)
/*:
 # Tuesday Stretch Problem 2.2
 ## Protocols and Protocol Extensions
 ### Instructions
 - Create a protocol called `Vehicle` that requires a variable for speed as a `Double`, a variable for isMoving as a `Bool`, and a `func startMoving()` and `func stopMoving()`.
 - Create two separate classes that conform to the `Vehicle` protocol (i.e. `class LawnMower` and `class Truck`). Your start and stop functions should simply check for whether or not the isMoving property is true or false, switch it to the opposite, and then print whether or not it is moving.
 - Create one instance of each of your two classes, and call your start and stop functions on them to be sure they work.
 - Notice that you have to write the same function in two distinct classes. Create an extension on your vehicle protocol and implement the two functions there. Now delete the two functions from your two classes. Notice that you do not have an error and that the functions still work.
 
 ### Black Diamond 💎💎💎
 - Create a `protocol Racer` that inherits from your first protocol and adds a `func race() -> Double`.
 - Implement your race function in a protocol extension. It should return the time it takes for the vehicle the function was called on to travel 1000 meters.
 - Create two more classes that conform to `Racer` or make your existing vehicles conform to `Racer`. Create another function outside of your classes that will take in two `Racer` objects and return the winner.
 */
import Foundation
protocol Vehicle: class {
    var speed: Double { get }
    var isMoving: Bool { get set }
    func startMoving()
    func stopMoving()
}
extension Vehicle {
    func startMoving() {
        if isMoving == true {
//            isMoving = false
            isMoving.toggle()
            print("Stopping...")
        } else {
//            isMoving = true
            isMoving.toggle()
            print("We're moving now")
        }
    }
    func stopMoving() {
        if isMoving == false {
//            isMoving = true
            isMoving.toggle()
            print("We're moving again")
        } else {
//            isMoving = false
            isMoving.toggle()
            print("Stopping...")
        }
    }
}
class LawnMower: Vehicle {
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
    
    
}
class Truck: Vehicle {
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
    
    
}
let johnDeer = LawnMower(speed: 50, isMoving: true)
let tundra = Truck(speed: 15, isMoving: false)
johnDeer.isMoving
johnDeer.stopMoving()
johnDeer.startMoving()
tundra.isMoving
tundra.startMoving()
tundra.stopMoving()

protocol Racer: Vehicle {
    func race() -> Double
}
//
//extension Racer {
//    func race() {
//        print("It'll take \(1000 / speed) moments to travel 1000 meters")
//    }
//}
class Porsche: Racer {
    func race() -> Double {
        print("It'll take \(1000 / speed) moments to travel 1000 meters")
        return 1000 / speed
    }
    
    var speed: Double
    var isMoving: Bool
    
    init(speed: Double, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
}
let nineFourtyFour = Porsche(speed: 500, isMoving: true)
nineFourtyFour.race()
let nineEleven = Porsche(speed: 1000, isMoving: true)
func winner(racerOne: Double, racerTwo: Double) -> String {
    if racerOne > racerTwo {
        return "racer 2 wins"
    } else {
        return "racer 1 wins"
    }
}
winner(racerOne: nineFourtyFour.race(), racerTwo: nineEleven.race())
//: [Number Printer](@next)
