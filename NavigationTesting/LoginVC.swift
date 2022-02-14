//
//  ViewController.swift
//  NavigationTesting
//
//  Created by Shobhakar Tiwari on 15/02/22.
//  Copyright © 2022 TNT. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentVC = self.navigationController?.topViewController
        print(currentVC)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        loginToNextScreen()
    }
    
    func loginToNextScreen() {
        
        if let objNextVC = self.storyboard?.instantiateViewController(identifier: "NextVC") as? NextVC {
            self.navigationController?.pushViewController(objNextVC, animated: true)
        }
        
    }
    
}

