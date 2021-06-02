import UIKit

public class GreetingViewController: UIViewController {
    
    @IBOutlet var greeting: UILabel!
    var items:[Item] = [Item(name:"Sold out, please check back later")]
    @IBOutlet var itemsList: UILabel!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        greeting = UILabel()
        greeting.accessibilityIdentifier = "Greeting"
        greeting.text = "Welcome to the Guilded Rose LLC!"
        itemsList = UILabel()
        
        let itemsText = items.map {$0.name}.joined(separator: ", ")

        itemsList.text = itemsText
    }

}
