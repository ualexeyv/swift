import UIKit

enum Teams {
    case real
    case barcelona
    case juventus
    case milan
    case zenit
    case inter
}

enum Position {
    case defender
    case middlefielder
    case goalkeeper
    case striker
}
enum LocalErrors: Error {
    case wrongSalary
    case wrongCountry
}

protocol Team {
    var nameOfTeam: Teams { get }
    var country: String { get }
}
class Players: Team {
    var nameOfTeam: Teams
    var country: String
    var fio: String
    var salary: Int
    var position: Position
    init (nameOfTeam: Teams, country: String, fio: String, salary: Int, position: Position) {
        self.nameOfTeam = nameOfTeam
        self.country = country
        self.fio = fio
        self.position = position
        self.salary = salary
    }
    func errorCheck () throws{
        var test = false
        guard self.salary > 0 else {throw LocalErrors.wrongSalary}
        for country in countries {
            if self.country == country {test = true}
        }
        guard test else {
            throw LocalErrors.wrongCountry
        }
        
    }
}
var countries = ["Spain","Italia","Russia","England","Ukraine"]
var player1 = Players (nameOfTeam: .barcelona, country: "Spain", fio: "Messi", salary: 2000, position: .striker)
var player2 = Players (nameOfTeam: .real, country: "Italia", fio: "Varan", salary: 5000, position: .defender)
var player3 = Players (nameOfTeam: .zenit, country: "fgdf", fio: "Kerzhakov", salary: -1000, position: .goalkeeper)


do {
    let _ = try player3.errorCheck()
} catch LocalErrors.wrongSalary {
    print ("ЗП не может быть отрицательной!!!")
} catch LocalErrors.wrongCountry {
    print ("Страна должна существовать!!!")
}

//А если в нашем случае будет отрицательная зп и несуществующая страна и надо обе ошибки показать??? эту конструкцию 2 раза выводить?
