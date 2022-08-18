//
//  DateParameter.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-07.
//

import Foundation

struct DateParameter {

    enum DateValueType {
        case today
        case yesterday
        case date(Date)
    }

    enum DateParameterError: Error {
        case noKey
        case noValue
        case badValue
    }

    private let dateFormat = "yyyy-MM-dd"
    private let realDate: Date
    let dateString: String

    init(_ dateType: DateValueType) {
        var baseDate: Date
        switch dateType {
        case .today:
            baseDate = Date()
        case .yesterday:
            baseDate = Date().addingTimeInterval(-24 * 60 * 60)
        case .date(let date):
            baseDate = date
        }

        let components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: baseDate)
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat

        self.realDate = components.date ?? Date()
        self.dateString = formatter.string(from: self.realDate)
    }

    init(from arguments: [String], with key: String) throws {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.timeZone = TimeZone(identifier: "GMT")
        guard let argumentIndex = arguments.firstIndex(of: key) else {
            throw DateParameterError.noKey
        }
        guard arguments.index(after: argumentIndex) < arguments.count else {
            throw DateParameterError.noValue
        }
        let value = arguments[arguments.index(after: argumentIndex)]
        var baseDate: Date
        switch value {
        case "today":
            baseDate = Date()
        case "yesterday":
            baseDate = Date().addingTimeInterval(-24 * 60 * 60)
        default:
            guard let dateValue = formatter.date(from: value) else {
                throw DateParameterError.badValue
            }
            baseDate = dateValue
        }

        let components = Calendar.current.dateComponents([.year, .month, .day], from: baseDate)
        print("\(components)")

        guard let year = components.year, let month = components.month, let day = components.day else {
            throw DateParameterError.noValue
        }

        self.realDate = Calendar.current.date(from: components)!
        self.dateString = "\(year)-\(String(format: "%02d", month))-\(String(format: "%02d", day))"
        print("MaxSov \(self.dateString)")
    }
}
