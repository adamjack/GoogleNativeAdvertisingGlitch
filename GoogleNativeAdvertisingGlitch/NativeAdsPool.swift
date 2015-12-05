//
//  NativeAdsPool.swift
//  GoogleNativeAdvertisingGlitch
//
//  Created by Adam R. B. Jack on 12/4/15.
//  Copyright © 2015 Testing. All rights reserved.
//

import UIKit


private let _singletonInstance = NativeAdsPool()

class NativeAdsPool {
    
    class var sharedInstance: NativeAdsPool {
        
        // This is a true singleton...
        return _singletonInstance
        
    }
    
    func advertise(info:String) {
        
       Log.sharedInstance.logInformation("Load Native Ads")
        
    }
    
}
