# NavigationTesting
Testing whether next view controller is pushed or not when user tap on login button

There are three different ways to test the navigation using TDD.

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
    
   - RunLoop.current.run(until: Date())
   The RunLoop. current. run(until: Date()) statement makes sure the run loop associated with the current thread has ample time to let the drawing operations to complete. After the loadView() method finishes, your view controller is ready to be tested
   
 - Screen Design : Screenshot attached.
    
[![Screenshot-2022-02-15-at-1-15-34-AM.png](https://i.postimg.cc/13K6c0wQ/Screenshot-2022-02-15-at-1-15-34-AM.png)](https://postimg.cc/mPttTHmX)


