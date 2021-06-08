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
            it("has a single item, the not in stock message") {
                let dataSource = ItemCollectionViewDataSource(items: [])
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                expect(numberOfItems).to(equal(1))
            }
            it("has one item") {
                let dataSource = ItemCollectionViewDataSource(items: [Item(name: "Foo")])
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                expect(numberOfItems).to(equal(1))
            }
            it("has six items") {
                let dataSource = ItemCollectionViewDataSource(items: Item.testData)
                let collectionView = buildCollectionView()

                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                expect(numberOfItems).to(equal(6))
            }
        }
    }
}
