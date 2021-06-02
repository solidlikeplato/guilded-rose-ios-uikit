import UIKit

public class GreetingViewController: UIViewController {
    
    @IBOutlet public var greeting: UILabel!
    public var items:[Item] = [Item(name:"Sold out, please check back later")]
    @IBOutlet public var itemsList: UILabel!
    @IBOutlet public var itemCollectionView: UICollectionView!
    var itemCollectionViewDataSource = ItemCollectionViewDataSource(items: [Item(name: "FooBar")])
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        itemCollectionView.dataSource = itemCollectionViewDataSource
        greeting = UILabel()
        greeting.accessibilityIdentifier = "Greeting"
        greeting.text = "Welcome to the Guilded Rose LLC!"
        itemsList = UILabel()
        
        
        
        let itemsText = items.map {$0.name}.joined(separator: ", ")

        itemsList.text = itemsText
    }

}
