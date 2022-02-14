//
//  SpyNavigationController.swift
//  NavigationTestingTests
//
//  Created by Shobhakar Tiwari on 15/02/22.
//  Copyright © 2022 TNT. All rights reserved.
//

import UIKit

class SpyNavigationController : UINavigationController {
    
    
    var pushedViewController : UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }
    
}
