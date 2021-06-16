import UIKit

public class GreetingViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet public var greeting: UILabel!
    @IBOutlet public var itemCollectionView: UICollectionView!
    @IBOutlet public var noItemsLabel: UILabel!
    var data: [Item] = []
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

        ItemRepository().getItems() { (items: [Item]) in
            self.datasource = ItemCollectionViewDataSource(items: items)
            self.data = items
            print("Closure")
        }
        print("viewDidLoad")
        toggleListDisplay(data: data)
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = datasource
        
        greeting.accessibilityIdentifier = "Greeting"
        itemCollectionView.accessibilityIdentifier = "itemCollectionView"
    }
}
