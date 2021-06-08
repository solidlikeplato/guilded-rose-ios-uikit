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
        //        it("updates the greeting text") {
        //
        //
        //            let greeting = UILabel()
        //            greeting.text = "Original Text"
        //            controller.greeting = greeting
        //
        //            controller.viewDidLoad()
        //
        //            expect(controller.greeting.text).to(equal("Welcome to the Guilded Rose LLC!"))
        //        }
        //
        //        it("displays the no items message when there are zero items") {
        //            let datasource = ItemCollectionViewDataSource(items:[Item(name:"foobar")])
        //
        //            controller.itemCollectionView.dataSource = datasource
        ////                controller.viewDidLoad()
        //
        //            expect(controller
        //                    .itemCollectionView
        //                    .cellForItem(at:IndexPath(row: 0, section: 0)))
        //                .to(beNil())
        //
        //        }
        //        it("updates the items list with one item") {
        //            controller.items[0] = GuildedRoseLLC.Item(name: "Concert Tickets")
        //            controller.viewDidLoad()
        //
        //            expect(controller.itemsList.text).to(equal("Concert Tickets"))
        //        }
        //        it("updates the items list with many items") {
        //            controller.items = [GuildedRoseLLC.Item(name: "Foo"), GuildedRoseLLC.Item(name:"Bar"), GuildedRoseLLC.Item(name:"FooBar")]
        //
        //            controller.viewDidLoad()
        //
        //            expect(controller.itemsList.text).to(equal("Foo, Bar, FooBar"))
        //        }
    }
}
