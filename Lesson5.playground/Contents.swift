import UIKit

extension Tower {
    func hit(enemy: inout Healthable) {
        enemy.health -= damage
    }
}
extension Goblin: CustomStringConvertible {
    var description: String {
        return "Описание гоблина:\n Health: \(self.health)\n Damage: \(self.damage)"
    }
}
extension ArcherTower: CustomStringConvertible {
    var description: String {
        return "Описание башни:\n Health: \(self.health)\n Damage: \(self.damage)"
    }
}
extension Goblin {
    func hit(tower: inout Healthable) {
        tower.health -= damage
    }
}
protocol Healthable {
    var health:Int {get set}
}
protocol MeleeAttacker {
    var damage:Int {get}
    var range:Int {get}
    func hit(tower:inout Healthable)
}
protocol Tower:AnyObject {
    var damage:Int {get}
    var range:Int {get}
    func hit(enemy:inout Healthable)
}
protocol Coordinates {
    var x:Int {get set}
}
class ArcherTower: Healthable, Tower, Coordinates {
    var x: Int = 5
    var health: Int = 300
    var damage: Int = 15
    var range: Int = 5
}
class Goblin: Healthable, MeleeAttacker, Coordinates {
    var x: Int = 1
    var health: Int = 150
    var damage: Int = 10
    var range: Int = 1
}
var archerTower = ArcherTower()
var goblin1 = Goblin()
var goblin = Goblin()
var goblinArray: [Goblin] = [goblin, goblin1]
var goblinHealth = goblin as Healthable
var towerHealth = archerTower as Healthable
var i = 0

print (goblin)
print (archerTower)

goblinHealth = goblinArray[i] as Healthable
repeat {
    if goblinArray[i].range<(archerTower.x - goblinArray[i].x) {
        goblinArray[i].x += 1
        print ("Goblin steps forward for 1")
    } else {
        (goblinArray[i] as MeleeAttacker).hit(tower: &towerHealth)
        print ("Goblin attack the tower and dealt \(goblinArray[i].damage) damage")
    }
    if archerTower.range>=(archerTower.x - goblinArray[i].x) {
        (archerTower as Tower).hit(enemy: &goblinHealth)
        print ("tower attack goblin and dealt \(archerTower.damage) damage")
    }
}  while archerTower.health>0 && goblin.health>0
if goblinArray[i].health <= 0 {
    print ("Goblin is dead\n")
}

//Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
//Создать несколько объектов каждого класса. Применить к ним различные действия.
//Вывести сами объекты в консоль.

enum Mark {
    case Volvo
    case Audi
    case Jeep
    case Lada
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Car has following properties:\n Mark: \(self.mark)\nhp: \(self.hp)\ntank: \(self.tank)\n"
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Trunk has following properties:\n Mark: \(self.mark)\nhp: \(self.hp)\ntank: \(self.tank)\n"
    }
}
extension Car {
    func toggleEngine () {
        self.isEngineOn.toggle()
    }
    func toggleDoor () {
        self.isDoorOpen.toggle()
    }
}
protocol Car:AnyObject {
    var mark: Mark {get}
    var hp: Int {get}
    var wheels: Int {get}
    var tank: Int {get set}
    var isEngineOn: Bool {get set}
    var isDoorOpen: Bool {get set}
}
class SportCar: Car {
    var mark: Mark
    var isEngineOn: Bool
    var isDoorOpen: Bool
    var hp: Int
    var wheels: Int
    var tank: Int
    var from0To100: Double
    init (isEngineOn: Bool, isDoorOpen: Bool, mark: Mark, wheels: Int, tank: Int, hp: Int, from0To100: Double) {
        self.hp = hp
        self.mark = mark
        self.isEngineOn = isEngineOn
        self.isDoorOpen = isDoorOpen
        self.tank = tank
        self.wheels = wheels
        self.from0To100 = from0To100
    }
}
class TrunkCar: Car {
    var mark: Mark = .Volvo
    var hp: Int = 500
    var wheels: Int = 8
    var tank: Int = 300
    var isEngineOn: Bool = false
    var isDoorOpen: Bool = false
    var volumeOfTrunk: Int = 2000
}
var car1 = SportCar(isEngineOn: false, isDoorOpen: false, mark: .Audi, wheels: 5, tank: 100, hp: 300, from0To100: 5.5)
car1.isEngineOn
car1.toggleEngine()
car1.isEngineOn

var trunk1 = TrunkCar()
trunk1.isEngineOn
trunk1.toggleEngine()
trunk1.isEngineOn

print (car1)
print (trunk1)

