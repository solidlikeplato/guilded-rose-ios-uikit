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
        
        itemName.text = item?.name
        sellIn.text = item?.sellIn ??? "None"
        quality.text = item?.quality ??? "None"
    }
}

infix operator ???: NilCoalescingPrecedence

public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String {
    switch optional {
    case let value?: return String(describing: value)
    case nil: return defaultValue()
    }
}
