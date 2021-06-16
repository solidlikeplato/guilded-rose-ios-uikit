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
    func setData() {
        print("setData")
        self.datasource = ItemCollectionViewDataSource(items: self.data)
        self.toggleListDisplay(data: self.data)
        self.itemCollectionView.dataSource = self.datasource
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        ItemRepository().getItems() { (items: [Item]) in
            self.datasource = ItemCollectionViewDataSource(items: items)
            self.data = items
            print("fetchData")
        }
    
        let seconds = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.setData()
        }
        print("viewDidLoad")

        self.itemCollectionView.delegate = self
        
        greeting.accessibilityIdentifier = "Greeting"
        itemCollectionView.accessibilityIdentifier = "itemCollectionView"
    }
}
