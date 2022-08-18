//
//  Command.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-07.
//

import Foundation

struct GetVisitsCommand: VisitsCommandProtocol {
    private enum Keys: String, CaseIterable {
        case visitDate
    }

    var visitDate = DateParameter(.today)
    var surveyHeaderIds: String
    var isHistoryTT = false
    var userGuid: String
    var commandType = CommandType.getVisits

    init() {
        surveyHeaderIds = "String"
        userGuid = "String"
    }

//    init(from commandLine: [String]) throws {
//        // look for parameter visitDate
//        self.visitDate = try parseVisitDate(from: commandLine)
//
////        let parsed = parse(from: ["String"])
////        self.surveyHeaderIds = parsed.surveyHeaderIds
//    }
}

extension GetVisitsCommand {

}

struct GetVisitsForPeriod: VisitsForPeriodCommandProtocol {
    var commandType = CommandType.getVisitsForPeriod
    var beginDate = DateParameter(.today)
}
