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
            it("updates the items list for no items") {
                let controller = GreetingViewController()
                controller.items[0] = Item(name: "Concert Tickets")
                controller.viewDidLoad()

                expect(controller.itemsList.text).to(equal("Concert Tickets"))
            }
        }
    }
}
