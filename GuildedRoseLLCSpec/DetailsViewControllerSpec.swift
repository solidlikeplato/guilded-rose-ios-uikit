import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class DetailsViewControllerSpec: QuickSpec {
    override func spec() {
        
        describe("View did load"){
            it("sets the item using the setItem closure"){
                let detailsController = ItemDetailsViewController()
                detailsController.nameLabel = UILabel()
                detailsController.qualityLabel = UILabel()
                detailsController.sellInLabel = UILabel()
                
                detailsController.setItem = {() in
                    return ItemBuilder()
                        .set(name: "FooBar")
                        .build()
                }
                
                
                detailsController.viewDidLoad()
                
                expect(detailsController.item?.name).to(equal("FooBar"))
            }
            
            it("sets the Item's sellIn and Quality") {
                let detailsController = ItemDetailsViewController()
                detailsController.nameLabel = UILabel()
                detailsController.qualityLabel = UILabel()
                detailsController.sellInLabel = UILabel()
                
                detailsController.setItem = {() in
                    let item = ItemBuilder()
                        .set(name: "FooBar")
                        .set(quality: 5)
                        .set(sellIn: 12)
                        .build()
                    return item
                }

                
                detailsController.viewDidLoad()
                
                expect(detailsController.item?.name).to(equal("FooBar"))
                expect(detailsController.item?.quality).to(equal(5))
                expect(detailsController.item?.sellIn).to(equal(12))
            }
            
            it("sets the UI elements to match the item") {
                let detailsController = ItemDetailsViewController()
                detailsController.nameLabel = UILabel()
                detailsController.qualityLabel = UILabel()
                detailsController.sellInLabel = UILabel()
                
                detailsController.setItem = {() in
                    let item = ItemBuilder()
                        .set(name: "FooBar")
                        .set(quality: 5)
                        .set(sellIn: 12)
                        .build()
                    return item
                }
                
                detailsController.viewDidLoad()
                
                expect(detailsController.nameLabel.text).to(equal("FooBar"))
                expect(detailsController.qualityLabel.text).to(equal("5"))
                expect(detailsController.sellInLabel.text).to(equal("12"))

            }
        }
    }
}
