import UIKit
enum windowState {
    case open, close
}
enum engineIsOn: String {
    case turnedOn = "Двигатель включен"
    case turnedOff = "Двигатель выключен"
}
enum mark: String {
    case Toyota, Volvo, Skoda, Mercedes, Renault, Acura, BMW, Dodge, Ford, Geely, Honda, Jeep, Kia, Nissan
}
struct sportCars {
    let mark: mark
    let years: Int
    let volumeOfTrunk: Double
    var engineIsOn: engineIsOn
    var windowState: windowState
    let filledVolume: Double
    init (mark: mark, years: Int, volumeOfTrunk: Double, filledVolume: Double) {
        self.mark = mark
        self.years = years
        self.volumeOfTrunk = volumeOfTrunk
        self.engineIsOn = .turnedOff
        self.windowState = .close
        self.filledVolume = filledVolume
        
    }
    mutating func turnEngineOn() {
        if engineIsOn == .turnedOff {
            return self.engineIsOn = .turnedOn
        } else {
            print ("Двигатель у \(self.mark) \(self.years) года выпуска уже включен")
        }
    }
    mutating func openWindow() {
        if windowState == .close {
            return self.windowState = .open
        } else {
            print (" У \(self.mark) \(self.years) года выпуска окно уже открыто")
        }
    }
}

struct trunkCars {
    let mark: mark
    let years: Int
    let volumeOfTrunkBody: Int
    var engineIsOn: engineIsOn {
        willSet {
            print ("Двигатель \(self.mark) \(self.years) года выпуска скоро включится")
        }
        didSet {
            print ("У \(self.mark) \(self.years) года выпуска Двигатель работает")
        }
        
    }
    var windowState: windowState
    var filledVolume: Int
    
    public mutating func turnEngineOn () {
        if engineIsOn == .turnedOff {
            return self.engineIsOn = .turnedOn
        } else {
            print ("Двигатель у \(self.mark) \(self.years) года выпуска уже включен")
        }
    }
    //не совсем понимаю как к этой функции обратиться из другой структуры
    public mutating func putSmthToTrunk (bag1: Int) {
        
        if filledVolume + bag1 > volumeOfTrunkBody {
            print ("В Багажник у \(self.mark) \(self.years) года выпуска груз объемом \(bag1) не помещается")
        } else {
            filledVolume += bag1
        }
    }
}

var sportCar1 = sportCars (mark: .Ford, years: 2010, volumeOfTrunk: 50, filledVolume: 10)

var trunkCar = trunkCars (mark: .Volvo, years: 2015, volumeOfTrunkBody: 5000, engineIsOn: .turnedOff, windowState: .close, filledVolume: 400)

print("Двигатель у \(sportCar1.mark) в состоянии  \(sportCar1.engineIsOn.rawValue)")
sportCar1.turnEngineOn()
print("Двигатель у \(sportCar1.mark) в состоянии \(sportCar1.engineIsOn.rawValue)")

print ("Двигатель у \(trunkCar.mark) в состоянии \(trunkCar.engineIsOn.rawValue)")
trunkCar.turnEngineOn()

trunkCar.putSmthToTrunk(bag1: 500)
print ("Объем груза в багажнике составляет \(trunkCar.filledVolume)")
trunkCar.putSmthToTrunk(bag1: 5000)

sportCar1.openWindow()
print (sportCar1.windowState)
sportCar1.openWindow()


