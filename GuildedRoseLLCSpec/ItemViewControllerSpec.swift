import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class ItemViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        describe("Loading the view") {
            var controller: GuildedRoseLLC.ItemsViewController!
            
            beforeEach {
                controller = GuildedRoseLLC.ItemsViewController()
                let itemCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout())
                controller.itemCollectionView = itemCollectionView
                controller.greeting = UILabel()
                controller.noItemsLabel = UILabel()
                controller.itemRepository = FakeItemRepository()
            }
            
            describe("viewDidLoad") {
                it("creates a data source") {
                    controller.viewDidLoad()
                    
                    expect(controller.itemCollectionView.dataSource).notTo(beNil())
                }
                
                it("creates a repository") {
                    controller.viewDidLoad()
                    
                    expect(controller.itemRepository).notTo(beNil())
                }
                
                it("sets the data source to an empty list") {
                    controller.viewDidLoad()
                    
                    let dataSource = controller.itemCollectionView.dataSource as? ItemCollectionViewDataSource
                    
                    expect(dataSource?.items).to(equal([]))
                }
            }
            
            describe("viewWillAppear") {
                it("sets the data source to a static item list") {
                    
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: Item.testData)
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)

                    let dataSource = controller.itemCollectionView.dataSource as? ItemCollectionViewDataSource
                    
                    expect(dataSource?.items).to(equal(Item.testData))
                }
                
                it("hides the item collection view when there are no items") {
                    
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: [])
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)
                    
                    expect(controller.itemCollectionView.isHidden).to(beTrue())
                    expect(controller.noItemsLabel.isHidden).to(beFalse())
                }
                
                it("hides the item collection view when there are no items") {
                    
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: [Item(name: "FooBar")])
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)
                    
                    expect(controller.itemCollectionView.isHidden).to(beFalse())
                    expect(controller.noItemsLabel.isHidden).to(beTrue())
                }
            }
        }
    }
}
