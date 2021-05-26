import Quick
import Nimble
import XCTest
import GuildedRoseLLC

class GuildedRoseLLCSpec: QuickSpec {
    override func spec() {
        describe("a sample test") {
            context("that passes") {
                it("true is true") {
                    expect(true).to(beTrue())
                }
            }
        }
        describe("the message") {
            context("for the greeting") {
                let app = XCUIApplication()
                app.launch()
                let labelElement = app.staticTexts["Greeting"]
                
                it("is 'Welcome to the Guilded Rose'"){
                    expect(labelElement.exists).to(beTrue())
                    expect(labelElement.label).to(equal("Welcome to the Guilded Rose LLC!"))
                }
            }
        }
    }
}
