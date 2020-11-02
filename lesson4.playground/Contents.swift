
import UIKit
enum Mark {
    case volvo, jeep, nissan, mercedes
}
//продумать энум Actions
enum Actions{
    case openWindow
    case closeWindow
    case openDoor
    case closeDoor
}
class Cars {
    let mark: Mark
    let year: Int
    let hp: Int
    
    func DoSmth (action: Actions) {}
    func openHatch () {}
    
    init (Mark: Mark, year: Int, hp: Int) {
        self.hp = hp
        self.mark = Mark
        self.year = year
    }
}

class SportCar:Cars {
    let from0To100: Double
    let wheelRadius:Int
    var isWindowOpen:Bool {
        didSet {
            if isWindowOpen {
                print ("Действие открыть окно выполнено")
            } else {
                print ("Действие закрыть окно выполнено")
                
            }
        }
    }
    var hatchStatus: Bool?
    init (from0To100: Double, wheelRadius: Int, isWindowOpen: Bool, Mark: Mark, hp: Int, year: Int, hatchStatus: Bool?) {
        self.from0To100 = from0To100
        self.wheelRadius = wheelRadius
        self.isWindowOpen = isWindowOpen
        self.hatchStatus = hatchStatus
        super.init(Mark: Mark, year: year, hp: hp)
    }
    
    override func DoSmth(action: Actions) {
        switch action {
        case .openWindow:
            if isWindowOpen {
                print ("Окно у \(self.mark) уже открыто")
                
            } else {
                isWindowOpen = true
                print ("Окно у \(self.mark) открыто")
            }
        case .closeWindow:
            if isWindowOpen {
                isWindowOpen = false
                print ("Окно у \(self.mark) закрыто")
                
            } else {
                print ("Окно у \(self.mark) уже закрыто")
            }
        default:
            break
        }
    }
    override func openHatch() {
        if ((hatchStatus) == nil) {
            print ("У \(self.mark) нет люка")
        } else if !hatchStatus! {
            hatchStatus = true
            print ("У \(self.mark) люк открыт")
        } else {
            print ("Hatch is already open")
        }
        
    }
}
class TrunkCar:Cars {
    let maxWeightAllowed: Int
    let cargoInTrunk:Int
    var isDoorOpen:Bool  {
        willSet {
            if isDoorOpen {
                print ("Действие закрыть дверь скоро произойдет")
        
            } else {
                print ("Действие открыть дверь скоро произойдет")
            }
        }
    }
    init (maxWeightAllowed: Int, cargoInTrunk: Int, isDoorOpen: Bool, Mark: Mark, hp: Int, year: Int) {
        self.maxWeightAllowed = maxWeightAllowed
        self.cargoInTrunk = cargoInTrunk
        self.isDoorOpen = isDoorOpen
        super.init (Mark: Mark, year: year, hp: hp)
    }
    override func DoSmth(action: Actions) {
        switch action {
        case .openDoor:
            if isDoorOpen {
                print ("дверь у \(self.mark) уже открыта")
                
            } else {
                isDoorOpen = true
                print ("дверь у \(self.mark) открыта")
            }
        case .closeDoor:
            if isDoorOpen {
                isDoorOpen = false
                print ("дверь у \(self.mark) закрыта")
                
            } else {
                print ("дверь у \(self.mark) уже закрыта")
            }
        default:
            break
        }
    }
}

var sportCar1 = SportCar (from0To100: 4.5, wheelRadius: 19, isWindowOpen: false, Mark: .mercedes, hp: 300, year: 2019, hatchStatus: false)
sportCar1.openHatch()
sportCar1.openHatch()

sportCar1.DoSmth(action: .openWindow)
sportCar1.DoSmth(action: .closeWindow)

var trunkCar1 = TrunkCar (maxWeightAllowed: 2000, cargoInTrunk: 200, isDoorOpen: false, Mark: .volvo, hp: 500, year: 2019)
trunkCar1.DoSmth(action: .openDoor)
trunkCar1.DoSmth(action: .openDoor)
trunkCar1.DoSmth(action: .closeDoor)



