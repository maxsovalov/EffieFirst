//
//  CommandProtocols.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-08.
//

import Foundation

protocol CommandProtocol {
    var commandType: CommandType { get }
}

protocol VisitsCommandProtocol: CommandProtocol {
    var visitDate: DateParameter { get }
    var surveyHeaderIds: String { get }
    var isHistoryTT: Bool { get }
    var userGuid: String { get }
}

protocol VisitsForPeriodCommandProtocol: CommandProtocol {
    var beginDate: DateParameter { get }
//    var questHeaderId: String { get }
//    var userGuid: String { get }
}

//extension CommandProtocol where TypeOfCommand == GetVisitsCommand {
////    var visitDate: Date { get }
//    func doSome() {
//
//    }
//}

//extension CommandProtocol where TypeOfCommand == GetVisitsForPeriod {
////    var beginDate: Date { get }
//}
