//
//  Leap.swift
//  Leap
//
//  Created by Sam McMyler on 1/19/17.
//  Copyright © 2017 Freddie. All rights reserved.
//

import Foundation

struct Year {
    var year = 0
    init(calendarYear: Int) {
        year = calendarYear
    }
    
    var isLeapYear: Bool {
        return (year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0
    }
    
}
