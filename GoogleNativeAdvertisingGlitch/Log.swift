//
//  Log.swift
//  GoogleNativeAdvertisingGlitch
//
//  Created by Adam R. B. Jack on 12/4/15.
//  Copyright © 2015 Testing. All rights reserved.
//

import UIKit


private let _singletonInstance = Log()


class Log {
    
    var information = [String]()
    
    class var sharedInstance: Log {
        
        // This is a true singleton...
        return _singletonInstance
        
    }
    
    // Log some message/event
    func logInformation(info:String) {
        
        information.append(info)
        
        print("Log: [\(info)]")
        
        // Let it be known..... to listeners
        NSNotificationCenter.defaultCenter().postNotificationName("Information", object: info)
    }
}
