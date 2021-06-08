import Quick
import Nimble
import GuildedRoseLLC
import XCTest

class ItemCollectionViewDataSourceSpec: QuickSpec {
    override func spec() {
        func buildCollectionView() -> UICollectionView {
            let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout())
            collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//            collectionView.register(UINib(nibName: "ChipViewCell", bundle: nil), forCellWithReuseIdentifier: "ChipViewCell")
            return collectionView
        }
        
        describe("the number of items") {
            context("with no items"){
                let dataSource = ItemCollectionViewDataSource(items: [])
                let collectionView = buildCollectionView()
                
                it("has a single item") {

                    let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
                    expect(numberOfItems).to(equal(1))
                }
                
                it("has no items message") {

                    
                }
            }
        }
    }
}
