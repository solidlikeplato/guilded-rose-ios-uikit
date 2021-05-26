import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class GuildedRoseLLCSpec: QuickSpec {
    override func spec() {
        var viewController: GreetingViewController?
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(identifier: "GreetingViewControllerID") as? GreetingViewController
        }
        
        describe("welcome screen") {
            beforeEach {
                let _ = viewController?.view
            }
        
            it("shows the Welcome screen") {
            }
        }
    }
}
