import Quick
import Nimble
import XCTest
import GuildedRoseLLC

class GuildedRoseLLCSpec: QuickSpec {

    override func spec() {
        var app: XCUIApplication!
        func launchWithCommandArgument(argument: String, app: XCUIApplication)
        {
            app.launchArguments.append(argument)
            app.launch()

        }
        
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
        
        describe("Items view") {
            context("When there are no items in stock") {
                it("displays sold out message") {
                    app = XCUIApplication()
                    launchWithCommandArgument(argument: "NO_ITEMS_IN_STOCK", app: app)

                    let view = app.collectionViews["itemCollectionView"]
                    let cells = view.descendants(matching: XCUIElement.ElementType.staticText).allElementsBoundByIndex
                    
                    expect(cells.count).to(equal(1))
                    expect(cells[0].label).to(equal("Sold out, please check back later"))
                
                }
            }
            
            context("With one item"){
                it("displays the single item") {
                    app = XCUIApplication()
                    launchWithCommandArgument(argument: "SINGLE_TEST_ITEM", app: app)

                    let view = app.collectionViews["itemCollectionView"]
                    let cells = view.descendants(matching: XCUIElement.ElementType.staticText).allElementsBoundByIndex
                    
                    expect(cells.count).to(equal(1))
                    expect(cells[0].label).to(equal("Foo"))
                }
            }
            
            context("With three items"){
                it("displays the three items") {
                    app = XCUIApplication()
                    launchWithCommandArgument(argument: "THREE_TEST_ITEMS", app: app)

                    let view = app.collectionViews["itemCollectionView"]
                    let cells = view.descendants(matching: XCUIElement.ElementType.staticText).allElementsBoundByIndex
                    
                    expect(cells.count).to(equal(3))
                    expect(cells[0].label).to(equal("Foo"))
                    expect(cells[1].label).to(equal("Foo"))
                    expect(cells[2].label).to(equal("Foo"))
                }
            }
        }
    }
}
