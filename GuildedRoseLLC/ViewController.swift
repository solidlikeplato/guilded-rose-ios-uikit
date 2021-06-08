import UIKit

public class GreetingViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet public var greeting: UILabel!
    @IBOutlet public var itemCollectionView: UICollectionView!
    @IBOutlet public var noItemsLabel: UILabel!
    var datasource: ItemCollectionViewDataSource?
    func toggleListDisplay(data: [Item]) {

        if data.isEmpty {
            itemCollectionView.isHidden = true
            noItemsLabel.isHidden = false
        } else {
            itemCollectionView.isHidden = false
            noItemsLabel.isHidden = true
        }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        let data = Item.getItems()
        datasource = ItemCollectionViewDataSource(items: data)
        itemCollectionView.dataSource = datasource
        itemCollectionView.delegate = self
        toggleListDisplay(data: data)
        
        greeting.accessibilityIdentifier = "Greeting"
        
        itemCollectionView.accessibilityIdentifier = "itemCollectionView"
    }

}
