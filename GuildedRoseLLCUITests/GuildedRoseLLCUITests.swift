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
        describe("the message") {
            context("for the greeting") {
                it("is 'Welcome to the Guilded Rose'"){
                    let labelElement = app.staticTexts["Greeting"]
                    expect(labelElement.exists).to(beTrue())
                    expect(labelElement.label).to(equal("Welcome to the Guilded Rose LLC!"))
                }
            }
        }
    }
}
