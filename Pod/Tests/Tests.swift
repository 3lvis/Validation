import UIKit
import XCTest

class Tests: XCTestCase {
    func testMaximumLengthValidation() {
        var validation = Validation()
        validation.maximumLength = 5

        XCTAssertTrue(validation.validateString("1234"))
        XCTAssertTrue(validation.validateString("12345"))
        XCTAssertFalse(validation.validateString("123456"))
    }

    func testMinimumLengthValidation() {
        var validation = Validation()
        validation.minimumLength = 5

        XCTAssertFalse(validation.validateString("1234"))
        XCTAssertTrue(validation.validateString("12345"))
        XCTAssertTrue(validation.validateString("123456"))
    }

    func testBetweenLengthsValidation() {
        var validation = Validation()
        validation.minimumLength = 5
        validation.maximumLength = 6

        XCTAssertFalse(validation.validateString("1234"))
        XCTAssertTrue(validation.validateString("12345"))
        XCTAssertTrue(validation.validateString("123456"))
        XCTAssertFalse(validation.validateString("1234567"))

        XCTAssertTrue(validation.validateString("1234", exhaustive: false))
        XCTAssertTrue(validation.validateString("12345", exhaustive: false))
        XCTAssertTrue(validation.validateString("123456", exhaustive: false))
        XCTAssertFalse(validation.validateString("1234567", exhaustive: false))
    }

    func testMaximumValueValidation() {
        var validation = Validation()
        validation.maximumValue = 100

        XCTAssertTrue(validation.validateString("50"))
        XCTAssertTrue(validation.validateString("100"))
        XCTAssertFalse(validation.validateString("200"))
    }

    func testMinimumValueValidation() {
        var validation = Validation()
        validation.minimumValue = 100

        XCTAssertFalse(validation.validateString("50"))
        XCTAssertTrue(validation.validateString("100"))
        XCTAssertTrue(validation.validateString("200"))
    }

    func testBetweenValuesValidation() {
        var validation = Validation()
        validation.minimumValue = 5
        validation.maximumValue = 6

        XCTAssertFalse(validation.validateString("4"))
        XCTAssertTrue(validation.validateString("5"))
        XCTAssertTrue(validation.validateString("6"))
        XCTAssertFalse(validation.validateString("7"))

        XCTAssertTrue(validation.validateString("4", exhaustive: false))
        XCTAssertTrue(validation.validateString("5", exhaustive: false))
        XCTAssertTrue(validation.validateString("6", exhaustive: false))
        XCTAssertFalse(validation.validateString("7", exhaustive: false))
    }

    func testRequiredValidation() {
        var validation = Validation()
        validation.required = true

        XCTAssertTrue(validation.validateString("12345"))
        XCTAssertFalse(validation.validateString(""))
    }

    func testEmailFormatValidation() {
        var validation = Validation()
        validation.format = "[\\w._%+-]+@[\\w.-]+\\.\\w{2,}"

        XCTAssertTrue(validation.validateString("elvisnunez@me.co"))
        XCTAssertFalse(validation.validateString("elvnume.co"))
        XCTAssertFalse(validation.validateString("hi there elvisnunez@me.com"))

        XCTAssertTrue(validation.validateString("elvisnunez@me.co", exhaustive: false))
        XCTAssertTrue(validation.validateString("elvnume.co", exhaustive: false))
        XCTAssertTrue(validation.validateString("hi there elvisnunez@me.com", exhaustive: false))
    }
}
