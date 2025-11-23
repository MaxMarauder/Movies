import XCTest

class MoviesUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
    }

    override func tearDown() {
        app = nil
    }

    func testOpenDetails() {
        app.launch()
        
        let cell = app.collectionViews.cells.firstMatch
        cell.tap()
        
        XCTAssertTrue(app.buttons["BackButton"].waitForExistence(timeout: 1))
    }

}
