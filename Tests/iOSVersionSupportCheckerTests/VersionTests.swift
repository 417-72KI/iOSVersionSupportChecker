import XCTest

@testable import struct iOSVersionSupportCheckerCore.Version

final class VersionTests: XCTestCase {
    func testExpressibleByStringLiteral_3_components() {
        let version: Version = "12.4.1"
        XCTAssertEqual(version.major, 12)
        XCTAssertEqual(version.minor, 4)
        XCTAssertEqual(version.patch, 1)
    }

    func testExpressibleByStringLiteral_2_components() {
        let version: Version = "11.4"
        XCTAssertEqual(version.major, 11)
        XCTAssertEqual(version.minor, 4)
        XCTAssertEqual(version.patch, 0)
    }

    func testExpressibleByStringLiteral_1_component() {
        let version: Version = "11"
        XCTAssertEqual(version.major, 11)
        XCTAssertEqual(version.minor, 0)
        XCTAssertEqual(version.patch, 0)
    }

    func testExpressibleByStringLiteral_invalid() {
        let version: Version = "invalid"
        XCTAssertEqual(version.major, 0)
        XCTAssertEqual(version.minor, 0)
        XCTAssertEqual(version.patch, 0)
    }

    func testCompare() {
        XCTAssertTrue(Version(major: 1, minor: 0, patch: 0) < "1.0.1")
        XCTAssertTrue(Version(major: 1, minor: 0, patch: 0) < "1.1.0")
        XCTAssertTrue(Version(major: 1, minor: 0, patch: 0) < "2.0.0")

        XCTAssertTrue(Version(major: 13, minor: 0, patch: 0) == "13.0.0")
        XCTAssertTrue(Version(major: 13, minor: 0, patch: 0) >= "13.0.0")
        XCTAssertTrue(Version(major: 13, minor: 0, patch: 0) > "12.4.1")
    }
}
