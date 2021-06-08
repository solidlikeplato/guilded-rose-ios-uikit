import UIKit

class ItemCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var items: [Item]
    override init() {
        self.items = Item.getItems()
    }
    
    init(items: [Item]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if items.count == 0 {
            self.items = [Item.noItemsInStock]
        }
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        cell.itemCellLabel.text = items[indexPath.row].name

        return cell
    }

}
