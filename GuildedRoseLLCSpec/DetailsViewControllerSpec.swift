import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class DetailsViewControllerSpec: QuickSpec {
    override func spec() {
        
        describe("View did load"){
            it("sets the item using the setItem closure"){
                let detailsController = DetailViewController()
                detailsController.itemName = UILabel()
                detailsController.quality = UILabel()
                detailsController.sellIn = UILabel()
                
                detailsController.setItem = {
                    () in return Item(name: "FooBar")
                }
                
                
                detailsController.viewDidLoad()
                
                expect(detailsController.item?.name).to(equal("FooBar"))
            }
            
            it("sets the Item's sellIn and Quality") {
                let detailsController = DetailViewController()
                detailsController.itemName = UILabel()
                detailsController.quality = UILabel()
                detailsController.sellIn = UILabel()
                
                detailsController.setItem = {
                    () in
                    var item = Item(name: "FooBar")
                    item.quality = 5
                    item.sellIn = 12
                    return item
                }

                
                detailsController.viewDidLoad()
                
                expect(detailsController.item?.name).to(equal("FooBar"))
                expect(detailsController.item?.quality).to(equal(5))
                expect(detailsController.item?.sellIn).to(equal(12))
            }
            
            it("sets the UI elements to match the item") {
                let detailsController = DetailViewController()
                detailsController.itemName = UILabel()
                detailsController.quality = UILabel()
                detailsController.sellIn = UILabel()
                
                detailsController.setItem = {
                    () in
                    var item = Item(name: "FooBar")
                    item.quality = 5
                    item.sellIn = 12
                    return item
                }
                
                detailsController.viewDidLoad()
                
                expect(detailsController.itemName.text).to(equal("FooBar"))
                expect(detailsController.quality.text).to(equal("5"))
                expect(detailsController.sellIn.text).to(equal("12"))

            }
        }
    }
}
