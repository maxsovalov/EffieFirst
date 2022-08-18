//
//  CommandType.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-08.
//

import Foundation

enum CommandType: String, CaseIterable {
    /// Description: https://ipland.atlassian.net/wiki/spaces/EWE/pages/1991540847
    case getVisits = "getVisits"
    case getVisitsForPeriod = "getVisitsForPeriod"
    case spentTimeByEmployee = "SpentTimeByEmployee"
    case getRoutes = "getRoutes"
}
