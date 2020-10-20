import Foundation
//MARK:= Поиск корней уравнения ax2+bx+c=0
let a = 1.0;
let b = 2.0;
let c = -5.0;

let d = (b*b) - (4*a*c)

let solve1 = (-b - sqrt(d))/(2*a)
let solve2 = (-b + sqrt(d))/(2*a)
print ("Первый корень уравнения x1 = \(solve1) \n Второй корень уравнения x2 = \(solve2) \n")

//MARK:= Поиск гипотенузы С прямоугольного треугольника со сторонами katA и katB, его площади и периметра

let katA = 5.0
let katB = 4.0

let hypotenC = sqrt((katA*katA)+(katB*katB))
let square = katA*katB/2
let Perimeter = hypotenC+katA+katB

print ("Гипотенуза С равна \(hypotenC) \n Площадь треугольника равна \(square) \n Периметр треугольника равен \(Perimeter) \n")

//MARK:= Банковский вклад

var sum = 100_000
let bankPercent = 10
let years = 5
var i = 0
while i < years {
    i+=1
    sum += sum*bankPercent/100
}

print ("Сумма на счету через 5 лет составит \(sum) рублей")
