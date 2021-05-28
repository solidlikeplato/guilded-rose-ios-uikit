import UIKit

public class GreetingViewController: UIViewController {
    
    @IBOutlet var greeting: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        greeting = UILabel()
        greeting.accessibilityIdentifier = "Greeting"
        greeting.text = "Welcome to the Guilded Rose LLC!"
    }

}

