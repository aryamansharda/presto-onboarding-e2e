import XCTest

final class PrestoTestAppUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testVersionMarkerAndIncrement() throws {
        let app = XCUIApplication()
        app.launchEnvironment["PRESTO_RESET_FIXTURE_STATE"] = "1"
        app.launch()

        XCTAssertTrue(app.staticTexts["Presto E2E"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts["fixture-version"].label.hasPrefix("Version: "))
        XCTAssertEqual(app.staticTexts["fixture-count"].label, "Count: 0")

        app.buttons["increment-button"].tap()
        XCTAssertEqual(app.staticTexts["fixture-count"].label, "Count: 1")
    }
}
