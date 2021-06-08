import UIKit

public class GreetingViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet public var greeting: UILabel!
    @IBOutlet public var itemCollectionView: UICollectionView!
    var itemCollectionViewDataSource = ItemCollectionViewDataSource()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        itemCollectionView.dataSource = itemCollectionViewDataSource
        itemCollectionView.delegate = self
        greeting = UILabel()
        greeting.accessibilityIdentifier = "Greeting"
        greeting.text = "Welcome to the Guilded Rose LLC!"
    }

}
