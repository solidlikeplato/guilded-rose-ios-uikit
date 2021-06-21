import UIKit

public class ItemCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        cell.itemCellLabel.text = items[indexPath.row].name

        return cell
    }
}
