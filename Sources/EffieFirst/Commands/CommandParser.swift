//
//  CommandParser.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-08.
//

import Foundation

struct CommandParser {
    private var arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) throws {
        guard arguments.count > 1 else {
            throw CommandParserError.noInputParameters
        }
        self.arguments = arguments
    }

    func parseCommandType() throws -> CommandType {
        guard let commandType = CommandType(rawValue: arguments[1]) else {
            throw CommandParserError.commandNotFound
        }
        return commandType
    }
}

enum CommandParserError: Error {
    case noInputParameters
    case commandNotFound
}
