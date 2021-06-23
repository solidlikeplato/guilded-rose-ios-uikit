import UIKit

public class ItemsViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet public var greeting: UILabel!
    @IBOutlet public var itemCollectionView: UICollectionView!
    @IBOutlet public var noItemsLabel: UILabel!
    
    public var dataSource: ItemCollectionViewDataSource?
    public var itemRepository: ItemRepository = RemoteItemRepository()

    override public func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        
        greeting.accessibilityIdentifier = "Greeting"
        itemCollectionView.accessibilityIdentifier = "itemCollectionView"
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var items: [Item] = []
        itemRepository.getItems() {(data: [Item]) in
            items = data
            DispatchQueue.main.async {
                self.configureDataSource(items: items)
                self.toggleListDisplay(items: items)
            }
        }

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
    
    private func configureDataSource(items: [Item] = []) {
        dataSource = ItemCollectionViewDataSource()
        dataSource?.show(items: items)
        
        itemCollectionView.dataSource = dataSource
        itemCollectionView.delegate = self
        
    }
}
