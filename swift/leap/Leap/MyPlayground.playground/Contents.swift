//: Playground - noun: a place where people can play

import Cocoa

infix operator |> { associativity left precedence 80}
func |> <T, U>(value: T, function: (T -> U)) -> U {
    return function(value)
}

//struct Year {
//    var year = 0
//    init(calendarYear: Int) {
//        year = calendarYear
//    }
//    
//    var isLeapYear: Bool {
//        return (year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0
//    }
//    
//}

class Year {
    var year = 0
    init(calendarYear: Int) {
        year = calendarYear
    }
    var isLeapYear: Bool {
        switch 0 {
        case year % 400:
            return true
        case year % 100:
            return false
        case year % 4:
          return true
        default:
            return false
        }
//        return (year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0
    }
    
}
let year = Year(calendarYear: 1900)
year.isLeapYear



