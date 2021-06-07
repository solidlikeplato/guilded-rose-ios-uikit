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
//                controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GreetingViewControllerID") as? GuildedRoseLLC.GreetingViewController
            }
            it("updates the greeting text") {


                let greeting = UILabel()
                greeting.text = "Original Text"
                controller.greeting = greeting
                
                controller.viewDidLoad()

                expect(controller.greeting.text).to(equal("Welcome to the Guilded Rose LLC!"))
            }
            it("displays the no items message when there are zero items") {
                
                controller.viewDidLoad()
                
                expect(controller.itemsList.text).to(equal("Sold out, please check back later"))
            }
            it("updates the items list with one item") {
                controller.items[0] = GuildedRoseLLC.Item(name: "Concert Tickets")
                controller.viewDidLoad()

                expect(controller.itemsList.text).to(equal("Concert Tickets"))
            }
            it("updates the items list with many items") {
                controller.items = [GuildedRoseLLC.Item(name: "Foo"), GuildedRoseLLC.Item(name:"Bar"), GuildedRoseLLC.Item(name:"FooBar")]
                
                controller.viewDidLoad()
                
                expect(controller.itemsList.text).to(equal("Foo, Bar, FooBar"))
            }
        }
    }
}
