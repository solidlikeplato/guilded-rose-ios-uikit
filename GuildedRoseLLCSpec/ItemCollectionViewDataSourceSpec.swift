import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class ItemCollectionViewDataSourceSpec: QuickSpec {
    
    override func spec() {
        
        func buildCollectionView() -> UICollectionView {
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout())
            collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            
            return collectionView
        }
        
        describe("the number of items") {
            it("has no items") {
                let dataSource = ItemCollectionViewDataSource()
                dataSource.show(items: [])
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                
                expect(numberOfItems).to(equal(0))
            }
            
            it("has one item") {
                let dataSource = ItemCollectionViewDataSource()
                dataSource.show(items: [Item(name: "Foo")])
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                
                expect(numberOfItems).to(equal(1))
            }
            
            it("has six items") {
                let dataSource = ItemCollectionViewDataSource()
                dataSource.show(items: Item.testData)
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                
                expect(numberOfItems).to(equal(6))
            }
        }
    }
}
