//
//  NavigationTestingTests.swift
//  NavigationTestingTests
//
//  Created by Shobhakar Tiwari on 15/02/22.
//  Copyright © 2022 TNT. All rights reserved.
//

import XCTest
@testable import NavigationTesting

class NavigationTestingTests: XCTestCase {

    var objNavigationController : UINavigationController?
    var objLoginVC              : LoginVC?
    
    override func setUp() {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
            objLoginVC = storyboard.instantiateViewController(identifier: "LoginVC") as? LoginVC
                        
            objNavigationController = UINavigationController(rootViewController: objLoginVC!)

            objLoginVC?.loadViewIfNeeded()
    }

    override func tearDown() {
        objNavigationController = nil
        objLoginVC              = nil
    }
    
    
    func testLoginButton_NextVCControllerPushed_V1() {
        
        let myPredicate = NSPredicate { (input, _)  in
            return (input as? UINavigationController)?.topViewController is NextVC
        }
        
        expectation(for: myPredicate, evaluatedWith: objNavigationController)
        objLoginVC?.loginButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 1.5)
    }
    
    //Alternative ways
    func testLoginButton_NextVCControllerPushed_V2() {
        objLoginVC?.loginButton.sendActions(for: .touchUpInside)
        RunLoop.current.run(until: Date())
        
        guard let _ = objNavigationController?.topViewController as? NextVC else {
            XCTFail()
            return
        }
    }
    
    func testLoginButton_NextVCControllerPushed_V3() {
        
        let spyNavController  =  SpyNavigationController(rootViewController: objLoginVC!)
        
        objLoginVC?.loginButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavController.pushedViewController as? NextVC else {
            XCTFail()
            return
        }
    }


}
