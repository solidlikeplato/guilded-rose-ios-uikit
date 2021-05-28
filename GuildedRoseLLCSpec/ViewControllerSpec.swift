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
        }
    }
}
