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
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        itemRepository.getItems() {(items: [Item]) in
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
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ItemSegue.showDetails {
            let destination = segue.destination as! DetailViewController
            let button = sender as! UIButton
            let item: Item = (self.dataSource?.items[button.tag])!
            destination.setItem = {
                () in
                return item
            }
        }
    }
}
