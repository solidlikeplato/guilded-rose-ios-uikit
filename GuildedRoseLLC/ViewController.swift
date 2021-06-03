import UIKit

class ItemCollectionViewCell : UICollectionViewCell {

    @IBOutlet var itemCell: UIView!
    
    @IBOutlet var itemCellLabel: UILabel!
}

class ItemCollectionViewDataSource : NSObject, UICollectionViewDataSource {
    let reuseIdentifier = "cell"
    
    init(items: [Item]) {}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        
        cell.itemCellLabel.text = "FooBar"
//        let label = UILabel()
//        label.text = "FooBar"
//        cell.contentView.addSubview(label)
        print (cell.itemCellLabel.text ?? "helloCell?")
        print ("Label things!!!")
        return cell
    }

}
public class GreetingViewController: UIViewController {
    
    @IBOutlet var greeting: UILabel!
    var items:[Item] = [Item(name:"Sold out, please check back later")]
    @IBOutlet var itemsList: UILabel!
    @IBOutlet var itemCollectionView: UICollectionView!
    let itemCollectionViewDataSource = ItemCollectionViewDataSource(items: [])
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        itemCollectionView.dataSource = itemCollectionViewDataSource
        greeting = UILabel()
        greeting.accessibilityIdentifier = "Greeting"
        greeting.text = "Welcome to the Guilded Rose LLC!"
        itemsList = UILabel()
        
        let itemsText = items.map {$0.name}.joined(separator: ", ")

        itemsList.text = itemsText
        print ("View Did Load")
    }

}
