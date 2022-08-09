//
//  CommandType.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-08.
//

import Foundation

enum CommandType: String, CaseIterable {
    case getVisits = "getVisits"
    case getVisitsForPeriod = "getVisitsForPeriod"
    case spentTimeByEmployee = "SpentTimeByEmployee"
    case getRoutes = "getRoutes"
}
