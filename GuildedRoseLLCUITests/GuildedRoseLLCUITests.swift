import Quick
import Nimble
import XCTest
import GuildedRoseLLC

class GuildedRoseLLCSpec: QuickSpec {
    override func spec() {
        var app: XCUIApplication!
        beforeEach {
            app = XCUIApplication()
            app.launch()
        }
        describe("the greeting message") {
            context("for the greeting") {
                it("is 'Welcome to the Guilded Rose'"){
                    let labelElement = app.staticTexts["Greeting"]
                    expect(labelElement.exists).to(beTrue())
                    expect(labelElement.label).to(equal("Welcome to the Guilded Rose LLC!"))
                }
            }
        }
        describe("Items in stock heading") {
            it("displays 'Items in stock' text") {
                let labelElement = app.staticTexts["StockAvailabilityHeading"]
                expect(labelElement.exists).to(beTrue())
                expect(labelElement.label).to(equal("Items in stock:"))
            }
        }
    }
}
