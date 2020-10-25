import UIKit

//MARK:= Divide numbers
let num1 = 11
let num2 = 3
func oddsNum (enter num1: Int, dividedBy num2: Int) -> Bool {
    switch num1 % num2 {
        case 0: return true
        default: return false
    }
}
switch oddsNum(enter: num1, dividedBy: num2) {
    case true: print ("число \(num1) делится без остатка на число \(num2)")
    default: print ("число \(num1) не делится без остатка на число \(num2)")
}

//MARK:= Creation an Array of 100 numbers

var arrayOfRisingNum = [Int]()
var i = 2
while i<=101 {
    
    arrayOfRisingNum.append(i)
    i += 1
}
print (arrayOfRisingNum)

//MARK:= Delete odds numbers and numbers divided by 3

func deleteOddsAndBy3 (arrayOfNum: Array<Int>) -> Array<Int> {
    var newArray = [Int]()
    for i in arrayOfNum {
        if i % 2 != 0 && i % 3 == 0 {
            newArray.append(i)
        }
    }
    
    return newArray
}
print ("Массив без четных чисел и чисел, которые не делятся на 3 \(deleteOddsAndBy3(arrayOfNum: arrayOfRisingNum))")

// MARK:= Fibanacсi Array

var fibArr = [0, 1]
var count1 = 0
var nextNum = 0

func FibanacciNum (first num1: Int, second num2: Int) -> Int {
    return num1+num2
}
while count1 < 50 {
    //при выставлении 100 выдает ошибку, видимо, выходит за рамки диапазона
    
    nextNum = FibanacciNum(first: fibArr[count1], second: fibArr[count1+1])
    fibArr.append(nextNum)
    count1 += 1
}
print ("Массив из чисел Фибоначи \(fibArr)")

//MARK:= Array of Simple numbers

var resultArray = [Int]()

resultArray.append(arrayOfRisingNum[0])
var filteredArray = arrayOfRisingNum.filter ({$0 % arrayOfRisingNum[0] != 0})
repeat {
    resultArray.append(filteredArray[0])
    filteredArray = filteredArray.filter ({$0 % filteredArray[0] != 0})
} while !(filteredArray.isEmpty)
print (resultArray)
