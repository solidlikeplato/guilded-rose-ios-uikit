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
        
        describe("greeting message") {
            it("displays the welcome greeting"){
                let labelElement = app.staticTexts["Greeting"]
                expect(labelElement.exists).to(beTrue())
                expect(labelElement.label).to(equal("Welcome to the Guilded Rose LLC!"))
            }
        }
        
        describe("Items in stock heading") {
            it("displays 'Items in stock' text") {
                let labelElement = app.staticTexts["StockAvailabilityHeading"]
                expect(labelElement.exists).to(beTrue())
                expect(labelElement.label).to(equal("Items in stock:"))
            }
        }
        
        describe("Items message") {
            context("When there are no items in stock") {
                it("displays sold out message") {
                    let labelElement = app.staticTexts["SoldOutMessage"]
                    expect(labelElement.exists).to(beTrue())
                    expect(labelElement.label).to(equal("Sold out, please check back later."))
                }
            }
        }
    }
}
