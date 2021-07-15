import UIKit

public class ItemDetailsViewController: UIViewController {
  
    @IBOutlet public var qualityLabel: UILabel!
    @IBOutlet public var sellInLabel: UILabel!
    @IBOutlet public var nameLabel: UILabel!
    public var setItem: (() -> Item)?
    public var item: Item?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let thisItem = setItem? () {
            self.item = thisItem
        }
        
        if let item = item {
            nameLabel.text = item.name
            sellInLabel.text = String(item.sellIn)
            qualityLabel.text = String(item.quality)
        }
    }
}
