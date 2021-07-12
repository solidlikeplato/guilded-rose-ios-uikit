import UIKit

public class DetailViewController: UIViewController {
  
    @IBOutlet public var itemName: UILabel!
    public var setItem: (() -> Item)?
    public var item: Item?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let thisItem = setItem? () {
            self.item = thisItem
        }
        itemName.text = item?.name
    }
}
