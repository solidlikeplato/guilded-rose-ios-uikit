import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class ItemViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        context("Loading the view") {
            var controller: GuildedRoseLLC.ItemsViewController!
            
            beforeEach {
                controller = GuildedRoseLLC.ItemsViewController()
                let itemCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout())
                controller.itemCollectionView = itemCollectionView
                controller.greeting = UILabel()
                controller.noItemsLabel = UILabel()
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

                    expect((controller.itemCollectionView.dataSource as? ItemCollectionViewDataSource)?.items).to(equal([]))
                }
            }
            
            describe("viewWillAppear") {
                it("sets the data source to a static item list") {
                    let expectedTestData = [
                        Item(name: "Foo"),
                        Item(name: "Bar"),
                        Item(name: "FooBar"),
                        Item(name: "Lorem"),
                        Item(name: "Ipsum"),
                        Item(name: "VeniVidiVici"),
                    ]
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: expectedTestData)
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)
                    
                    expect((controller.itemCollectionView.dataSource as? ItemCollectionViewDataSource)?.items).toEventually(equal(expectedTestData))
                }
                
                it("hides the item collection view when there are no items") {
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: [])
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)
                    
                    expect(controller.itemCollectionView.isHidden).toEventually(beTrue())
                }
                
                it("shows the 'no items message' when there are no items") {
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: [])
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)
                    
                    expect(controller.noItemsLabel.isHidden).toEventually(beFalse())
                }
                
                it("shows the item collection view when there is an item") {
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: [Item(name: "FooBar")])
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)
                    
                    expect(controller.itemCollectionView.isHidden).to(beFalse())
                }
                
                it("does not show the 'no items message' when there are items") {
                    let itemRepository = FakeItemRepository()
                    itemRepository.stub(items: [Item(name: "FooBar")])
                    controller.itemRepository = itemRepository
                    
                    controller.viewDidLoad()
                    controller.viewWillAppear(true)
                    
                    expect(controller.noItemsLabel.isHidden).toEventually(beTrue())
                }
            }
        }
        
        context("transitioning to another view") {
            var itemsController: GuildedRoseLLC.ItemsViewController!
            var detailsController: GuildedRoseLLC.DetailViewController!
            var button:UIButton!
            let item = Item(name: "foo")
            
            beforeEach {
                itemsController = ItemsViewController()
                let dataSource = GuildedRoseLLC.ItemCollectionViewDataSource()
                dataSource.show(items: [item])

                itemsController.dataSource = dataSource
         
                detailsController = DetailViewController()
                detailsController.itemName = UILabel()
                detailsController.quality = UILabel()
                detailsController.sellIn = UILabel()
                
                button = UIButton()
                button.tag = 0
            }
            
            describe("prepare for segue") {
                it("sets the item when 'DetailsPageSegue' is called") {
                    let segue = UIStoryboardSegue(identifier: ItemSegue.INDEXTODETAILSEGUEID, source: itemsController, destination: detailsController)
                    
                    itemsController.prepare(for: segue, sender: button)
                    detailsController.viewDidLoad()
                  
                    expect(detailsController.item).to(equal(item))
                }
                
                it("doesn't set the item when 'ArbitrarySegue' is called") {
                    let segue = UIStoryboardSegue(identifier: "ArbitrarySegue", source: itemsController, destination: detailsController)
                    
                    itemsController.prepare(for: segue, sender: button)
                    detailsController.viewDidLoad()
                  
                    expect(detailsController.item).to(beNil())
                }
            }
        }
    }
}
