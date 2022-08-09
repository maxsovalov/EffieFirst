//
//  VisitDate.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-07.
//

import Foundation

enum DateType {
    case today
    case yesterday
    case date(Date)
}

struct VisitDate {
    private var realDate: Date
    var dateString: String

    init(_ dateType: DateType) {
        switch dateType {
        case .today:
            realDate = Date()
        case .yesterday:
            realDate = Date()
        case .date(let date):
            realDate = date
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        dateString = formatter.string(from: realDate)
    }
}
