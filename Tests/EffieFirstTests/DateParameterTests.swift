//
//  DateParameterTests.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-14.
//

import XCTest
@testable import EffieFirst

class DateParameterTests: XCTestCase {

    // MARK: - Initialization

    func testWhenNoKey() throws {
        // PRECONDITION
        var error: Error?

        // INVOCATION
        XCTAssertThrowsError(try DateParameter(from: [], with: "Key"), "no comments") {
            error = $0
        }

        // ASSERTION
        XCTAssertEqual(DateParameter.DateParameterError.noKey, error as? DateParameter.DateParameterError)
    }

    func testWhenNoValue() throws {
        // PRECONDITION
        var error: Error?
        let key = "argumentKey"

        // INVOCATION
        XCTAssertThrowsError(try DateParameter(from: [key], with: key), "no comments") {
            error = $0
        }

        // ASSERTION
        XCTAssertEqual(DateParameter.DateParameterError.noValue, error as? DateParameter.DateParameterError)
    }

    func testWhenToday() throws {
        // PRECONDITION
        let key = "visitDate"
        var date: DateParameter?

        // INVOCATION
        XCTAssertNoThrow(date = try DateParameter(from: [key, "today"], with: key))

        // ASSERTION
        XCTAssertNotNil(date)
    }

    func testWhenYesterday() throws {
        // PRECONDITION
        let key = "visitDate"
        var date: DateParameter?

        // INVOCATION
        XCTAssertNoThrow(date = try DateParameter(from: [key, "yesterday"], with: key))

        // ASSERTION
        XCTAssertNotNil(date)
    }

    func testWhenCorrectCustomDate() throws {
        // PRECONDITION
        let key = "visitDate"
        var date: DateParameter?

        // INVOCATION
        XCTAssertNoThrow(date = try DateParameter(from: [key, "2022-09-05"], with: key))

        // ASSERTION
        XCTAssertNotNil(date)
    }

    func testWhenBadValue() throws {
        // PRECONDITION
        let key = "visitDate"
        var error: Error?

        // INVOCATION
        XCTAssertThrowsError(try DateParameter(from: [key, "2022-15"], with: key), "no comments") {
            error = $0
        }

        // ASSERTION
        XCTAssertEqual(DateParameter.DateParameterError.badValue, error as? DateParameter.DateParameterError)
    }
}
