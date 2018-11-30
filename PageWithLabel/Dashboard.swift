//
//  Dashboard.swift
//  PageWithLabel
//
//  Created by WHITEOPEN on 27/11/18.
//  Copyright © 2018 PT. WhiteOpen Technology. All rights reserved.
//

import UIKit

class Dashboard: UIViewController {

    @IBOutlet weak var helpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func helpBtnPressed(_ sender: Any) {
        let titleId = "HelpID"
        performSegue(withIdentifier: titleId, sender: nil)
    }
}
