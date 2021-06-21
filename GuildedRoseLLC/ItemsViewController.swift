import UIKit

public class ItemsViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet public var greeting: UILabel!
    @IBOutlet public var itemCollectionView: UICollectionView!
    @IBOutlet public var noItemsLabel: UILabel!
    
    var dataSource: ItemCollectionViewDataSource?
        
    override public func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ItemCollectionViewDataSource()
        configureDataSource(items: [])
        
        greeting.accessibilityIdentifier = "Greeting"
        itemCollectionView.accessibilityIdentifier = "itemCollectionView"
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let items = Item.getItems()
        configureDataSource(items: items)
        toggleListDisplay(items: items)
    }
    
    private func toggleListDisplay(items: [Item]) {
        if items.isEmpty {
            itemCollectionView.isHidden = true
            noItemsLabel.isHidden = false
        } else {
            itemCollectionView.isHidden = false
            noItemsLabel.isHidden = true
        }
    }
    
    private func configureDataSource(items: [Item]) {
        dataSource?.show(items: items)
        itemCollectionView.dataSource = dataSource
        itemCollectionView.delegate = self
    }
}
