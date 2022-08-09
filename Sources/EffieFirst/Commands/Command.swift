//
//  Command.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-07.
//

import Foundation

struct GetVisitsCommand: VisitsCommandProtocol {
    var surveyHeaderIds: [String]
    var isHistoryTT = false
    var userGuid: String
    var commandType = CommandType.getVisits
    var visitDate = VisitDate(.today)

    init() {
        surveyHeaderIds = [String]()
        userGuid = ": String"
    }

//    init(from commandLine: [String]) throws {
//
//    }
}

struct GetVisitsForPeriod: VisitsForPeriodCommandProtocol {
    var commandType = CommandType.getVisitsForPeriod
    var beginDate = VisitDate(.today)
}
