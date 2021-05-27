import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class GuildedRoseLLCSpec: QuickSpec {
    override func spec() {
        describe("greeting view controller") {
            it("associates a greeting with the storyboard") {
                let controller = GreetingViewController()
                let greeting = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                greeting.text = "Go away! this is not Guilded Rose LLC!"
                controller.Greeting = greeting

                expect(controller.Greeting.text).to(equal("Go away! this is not Guilded Rose LLC!"))
            }
        }
    }
}
