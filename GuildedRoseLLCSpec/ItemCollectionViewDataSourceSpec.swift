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
        
        describe("building a datasource with a list of items") {
            it("has no items by default") {
                let dataSource = ItemCollectionViewDataSource()
                dataSource.show()
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                
                expect(numberOfItems).to(equal(0))
            }
            
            it("has one item") {
                let dataSource = ItemCollectionViewDataSource()
                dataSource.show(items: [ItemBuilder.build(name: "Foo")])
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                
                expect(numberOfItems).to(equal(1))
            }
            
            it("has six items") {
                let testData = [
                    ItemBuilder.build(name: "Foo"),
                    ItemBuilder.build(name: "Bar"),
                    ItemBuilder.build(name: "FooBar"),
                    ItemBuilder.build(name: "Lorem"),
                    ItemBuilder.build(name: "Ipsum"),
                    ItemBuilder.build(name: "VeniVidiVici"),
                ]
                let dataSource = ItemCollectionViewDataSource()
                dataSource.show(items: testData)
                let collectionView = buildCollectionView()
                let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                
                expect(numberOfItems).to(equal(6))
            }
        }
    }
}
