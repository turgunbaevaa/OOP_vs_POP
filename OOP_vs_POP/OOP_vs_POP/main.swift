//
//  main.swift
//  OOP_vs_POP
//
//  Created by Aruuke Turgunbaeva on 7/2/24.
//

import Foundation

// OOP

class BirdClass {
    var name: String = ""
    var canFLy: Bool = true
    var flySpeed: Double = 0
    
    func distance(seconds: Float) -> Float {return 0}
}

class SwanWhiteClass: BirdClass {
    
}

class SwanBlackClass: BirdClass {
    
}

class PinguinClass: BirdClass {
    
}

// POP

protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol FlyingBird {
    var flySpeed: Float { get }
}

extension Bird {
    var canFly: Bool {
        return false
    }
}

extension Bird where Self: FlyingBird {
    var canFly: Bool {
        return true
    }
}

extension FlyingBird {
    func distance(seconds: Float) -> Float {
        seconds * flySpeed
    }
}

struct Pinguin: Bird {
    var name: String
}

let myPinguin = Pinguin(name: "Bob")
print(myPinguin.canFly)

enum Swan: String, Bird, FlyingBird {
    case white
    case black
    
    var flySpeed: Float {
        switch self {
        case .white: return 100
        case .black: return 140
        }
    }
    
    var name: String {
        return self.rawValue
    }
}

var myFirstSwean = Swan.black
print(myFirstSwean.canFly)
print(myFirstSwean.flySpeed)
print(myFirstSwean.distance(seconds: 50))

enum VehicleType {
    case electric
    case nonElectric
}

protocol Vehicle {
    var weight: Float { get }
    var speed: Float { get }
    var type: VehicleType { get }
    var canFly: Bool { get }
    
    func prepare()
}

extension Vehicle {
    func prepare() {
        if type == .electric {
            print("Charge")
        } else if type == .nonElectric {
            print("Refuel")
        }
    }
    
    var canFly: Bool {
        return false
    }
}

protocol FlyableVehicle {
    func getMaxHeight() -> Float
}

protocol FlyingVehicle: Vehicle, FlyableVehicle {
    var type: VehicleType { get }
}

extension FlyingVehicle {
    var canFly: Bool {
        return true
    }
    
    func getMaxHeight() -> Float {
        if type == .nonElectric {
            return weight * speed
        } else {
            return weight + speed
        }
    }
}

struct Car: Vehicle {
    var weight: Float = 200
    var speed: Float = 60
    var type: VehicleType = .nonElectric
}

struct ElectricCar: Vehicle {
    var weight: Float = 200
    var speed: Float = 60
    var type: VehicleType = .electric
}

struct Airplane: FlyingVehicle {
    var weight: Float = 200
    var speed: Float = 60
    var type: VehicleType = .nonElectric
}

struct ElectricalAirplane: FlyingVehicle {
    var weight: Float
    var speed: Float
    var type: VehicleType = .electric
}

let car = Car()
let electricCar = ElectricCar()
let airplane = Airplane()
let electricalAirplane = ElectricalAirplane(weight: 200, speed: 60)

print("Car: \(car.type) canFly: \(car.canFly)")
car.prepare()

print("ElectricCar: \(electricCar.type) canFly: \(electricCar.canFly)")
electricCar.prepare()

print("Airplane: \(airplane.type) canFly: \(airplane.canFly)")
print("getMaxHeight for Airplane: \(airplane.getMaxHeight())")

print("ElectricalAirplane: \(electricalAirplane.type) canFly: \(electricalAirplane.canFly)")
print("getMaxHeight for ElectricalAirplane: \(electricalAirplane.getMaxHeight())")

