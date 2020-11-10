import UIKit

protocol Person {
    var name: String { get }
    var age: Int { get }
    var weight: Double { get }
    var height: Double { get }
    var salaryPerDay: Double { get }
    var workDays: Int { get }
}
class Managers: Person {
    var name: String
    var age: Int
    var weight: Double
    var height: Double
    var salaryPerDay: Double
    var workDays: Int
    
    init (name: String, age: Int, weight: Double, height: Double, salaryPerDay: Double, workDays: Int) {
        self.age = age
        self.height = height
        self.name = name
        self.salaryPerDay = salaryPerDay
        self.weight = weight
        self.workDays = workDays
    }
}

struct Queue <T: Person> {
    private var elements: [T] = []
    
    mutating func pop() -> T? {
        guard elements.count > 0 else {
            return nil
        }
        return elements.removeFirst()
    }
    mutating func push(_ numForInsert: T) {
        return elements.append(numForInsert)
    }
    func totalSalary () -> Double {
        var totalSalary: Double = 0
        elements.forEach { totalSalary += $0.salaryPerDay * Double ($0.workDays) }
        return totalSalary
    }
    subscript (index: Int) -> Int? {
        guard index >= 0, index < elements.count, elements.count > 0 else {return nil}
    
        return elements[index].age
    }
    func filter (condition: (T) -> Bool) -> [T] {
        
        var tempElements: [T] = []
        for i in elements {
            if condition(i) {
                tempElements.append(i)
            }
        }
        return tempElements
    }
}

let manager1 = Managers (name: "Tom", age: 20, weight: 80, height: 180, salaryPerDay: 50, workDays: 22)
let manager2 = Managers (name: "Ivy", age: 25, weight: 65, height: 170, salaryPerDay: 100, workDays: 20)
let manager3 = Managers (name: "Stepan", age: 27, weight: 99, height: 199, salaryPerDay: 70, workDays: 25)
let arrayOfManagers = [manager1, manager2, manager3]
var queueOfManagers = Queue<Managers>()
arrayOfManagers.forEach {queueOfManagers.push($0)}

queueOfManagers.totalSalary()
queueOfManagers[2]

print (queueOfManagers.filter {$0.age >= 25}.count)


