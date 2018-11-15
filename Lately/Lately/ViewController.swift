//  ViewController.swift
//  Lately
//
//  Created by Alexandra Harrison on 11/12/18.
//  Copyright © 2018 Alexandra Harrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menu_button: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menu_button.target = revealViewController()
        menu_button.action = #selector(SWRevealViewController.revealToggle(_:))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

