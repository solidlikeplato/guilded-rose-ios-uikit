import Quick
import Nimble
import XCTest
import GuildedRoseLLC

class GuildedRoseLLCSpec: QuickSpec {

    override func spec() {
        
        var app: XCUIApplication!
        
        describe("greeting message") {
            it("displays the welcome header"){
                app = XCUIApplication()
                app.launch()
                let labelElement = app.staticTexts["Greeting"]
                let labelElement2 = app.staticTexts["StockAvailabilityHeading"]
                
                expect(labelElement.exists).to(beTrue())
                expect(labelElement.label).to(equal("Welcome to the Guilded Rose LLC!"))
                
                expect(labelElement2.exists).to(beTrue())
                expect(labelElement2.label).to(equal("Items in stock:"))
            }
        }
    }
}
