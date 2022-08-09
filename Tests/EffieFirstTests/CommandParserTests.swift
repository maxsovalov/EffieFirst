//
//  CommandParserTests.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-09.
//

import XCTest
@testable import EffieFirst

class CommandParserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initialization

    func testInitWhenAllGoodArguments() throws {
        // PRECONDITION

        // INVOCATION
        XCTAssertNoThrow(try CommandParser(arguments: ["One", "Two"]))

        // ASSERTION
    }

    func testWhenNoArguments() throws {
        // PRECONDITION
        var error: Error?

        // INVOCATION
        XCTAssertThrowsError(try CommandParser(arguments: []), "String") {
            error = $0
        }

        // ASSERTION
        XCTAssertEqual(CommandParserError.noInputParameters, error as? CommandParserError)
    }

    func testWhenOnlyOneArgument() throws {
        // PRECONDITION
        var error: Error?

        // INVOCATION
        XCTAssertThrowsError(try CommandParser(arguments: ["One"]), "String") {
            error = $0
        }

        // ASSERTION
        XCTAssertEqual(CommandParserError.noInputParameters, error as? CommandParserError)
    }

    // MARK: - Command Type

    func testParseCommandTypeWhenAllGood() throws {
        // PRECONDITION
        let allCommandTypes = CommandType.allCases
        var parsedCommandTypes = [CommandType]()

        // INVOCATION
        for commandType in allCommandTypes {
            let sut = try CommandParser(arguments: ["PathToFile", commandType.rawValue])
            parsedCommandTypes.append(try sut.parseCommandType())
        }

        // ASSERTION
        XCTAssertEqual(allCommandTypes.count, parsedCommandTypes.count)
        XCTAssertEqual(allCommandTypes, parsedCommandTypes)
    }

    func testParseCommandTypeWhenTypeUnknown() throws {
        // PRECONDITION
        let sut = try CommandParser(arguments: ["PathToFile", "unknownCommandType"])
        var error: Error?

        // INVOCATION
        XCTAssertThrowsError(try sut.parseCommandType()) {
            error = $0
        }

        // ASSERTION
        XCTAssertEqual(CommandParserError.commandNotFound, error as? CommandParserError)
    }
}
