import UIKit

class ItemCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var items: [Item]
    init(items: [Item]) {
        self.items = Item.getItems()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Item.getItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        
        cell.itemCellLabel.text = items[indexPath.row].name
//        let label = UILabel()



        return cell
    }

}
