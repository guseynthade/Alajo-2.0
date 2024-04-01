//
//  TabBarController.swift
//  Alajo
//
//  Created by God's on 2/28/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor(named: "bg")

        // Do any additional setup after loading the view.
    }

}
