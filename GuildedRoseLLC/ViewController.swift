//
//  ViewController.swift
//  GuildedRoseLLC
//
//  Created by Ethan Whaley on 5/25/21.
//

import UIKit

public class GreetingViewController: UIViewController {
    
    @IBOutlet var Greeting: UILabel!
    override public func viewDidLoad() {
        super.viewDidLoad()
        Greeting = UILabel()
        Greeting.accessibilityIdentifier = "Greeting"
        Greeting.text = "Welcome to the Guilded Rose LLC!"
        print(Greeting.text!)
        // Do any additional setup after loading the view.
    }

}

