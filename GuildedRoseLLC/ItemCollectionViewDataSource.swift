import UIKit

class ItemCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        cell.itemCellLabel.text = items[indexPath.row].name

        return cell
    }
}
