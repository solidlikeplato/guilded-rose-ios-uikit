import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class ViewControllerSpec: QuickSpec {
    override func spec() {
        describe("Loading the view") {
            it("updates the greeting text") {
                let controller = GreetingViewController()
                let greeting = UILabel()
                greeting.text = "Original Text"
                controller.greeting = greeting
                
                controller.viewDidLoad()

                expect(controller.greeting.text).to(equal("Welcome to the Guilded Rose LLC!"))
            }
            it("displays the no items message when there are zero items") {
                let controller = GreetingViewController()
                
                controller.viewDidLoad()
                
                expect(controller.itemsList.text).to(equal("Sold out, please check back later"))
            }
            it("updates the items list with one item") {
                let controller = GreetingViewController()
                controller.items[0] = Item(name: "Concert Tickets")
                controller.viewDidLoad()

                expect(controller.itemsList.text).to(equal("Concert Tickets"))
            }
            it("updates the items list with many items") {
                let controller = GreetingViewController()
                controller.items = [Item(name: "Foo"), Item(name:"Bar"), Item(name:"FooBar")]
                
                controller.viewDidLoad()
                
                expect(controller.itemsList.text).to(equal("Foo, Bar, FooBar"))
            }
        }
    }
}
