import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class ViewControllerSpec: QuickSpec {
    override func spec() {
        describe("Loading the view") {
            var controller: GuildedRoseLLC.GreetingViewController!
            beforeEach {
                controller = GuildedRoseLLC.GreetingViewController()
                let itemCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout())
                controller.itemCollectionView = itemCollectionView
            }
            describe("loading the view") {
                it("sets a data source") {
                    
                    controller.viewDidLoad()
                    
                    expect(controller.itemCollectionView.dataSource).notTo(beNil())
                }
            }

        }
    }
}
