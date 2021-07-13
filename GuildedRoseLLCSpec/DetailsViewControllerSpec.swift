import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class DetailsViewControllerSpec: QuickSpec {
    override func spec() {
        
        describe("View did load"){
            it("sets the item using the setItem closure"){
                let detailsController = DetailViewController()
                detailsController.setItem = {
                    () in return Item(name: "FooBar")
                }
                detailsController.itemName = UILabel()
                
                detailsController.viewDidLoad()
                
                expect(detailsController.item?.name).to(equal("FooBar"))
            }
        }
    }
}
