import UIKit

public class DetailViewController: UIViewController {
  
    @IBOutlet public var quality: UILabel!
    @IBOutlet public var sellIn: UILabel!
    @IBOutlet public var itemName: UILabel!
    public var setItem: (() -> Item)?
    public var item: Item?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let thisItem = setItem? () {
            self.item = thisItem
        }
        
        if let item = item {
            itemName.text = item.name
            sellIn.text = String(item.sellIn)
            quality.text = String(item.quality)
        }
    }
}
