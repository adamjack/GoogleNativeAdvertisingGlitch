//
//  AdvertisingNativeContext.swift
//  GoogleNativeAdvertisingGlitch
//
//  Created by Adam R. B. Jack on 12/4/15.
//  Copyright © 2015 Testing. All rights reserved.
//

import UIKit


struct DfpConfigConstant {

    static var Unit1        =   "/19706016/test_iOS_phone/spotlight_top"
    static var Unit2        =   "/19706016/test_iOS_phone/spotlight_tile"
    static var Template1    =   "10096256"

}

class AdvertisingNativeContext : NSObject, GADAdLoaderDelegate, GADNativeCustomTemplateAdLoaderDelegate {
    
    var         adLoader        : GADAdLoader!
    var         unit            : String!
    var         advertisementId : Int
    
    weak var    viewController  : UIViewController?
    
    init(viewController:UIViewController,
        unit:String,
        advertisementId:Int) {
            
            self.viewController     = viewController
            self.unit               = unit
            self.advertisementId    = advertisementId
            
            super.init()
            
            let options = GADNativeAdImageAdLoaderOptions()
            options.disableImageLoading = true
            
            // Prepare the loader...
            self.adLoader = GADAdLoader(adUnitID: self.unit,
                rootViewController: self.viewController,
                adTypes: [kGADAdLoaderAdTypeNativeCustomTemplate],
                options: [options])
            
            self.adLoader.delegate = self
    }
    
    func load() {
        
        if let adLoader = self.adLoader {
            
            let request = DFPRequest()
            
            request.gender = .Unknown
            request.keywords = ["Bits","n","Bobs"]
            
            // Make the request...
            adLoader.loadRequest(request)
            
         }
    }
    
    
    func nativeCustomTemplateIDsForAdLoader(adLoader: GADAdLoader!) -> [AnyObject]! {
        return [DfpConfigConstant.Template1]
    }
    
    func adLoader(adLoader: GADAdLoader!, didReceiveNativeCustomTemplateAd nativeCustomTemplateAd: GADNativeCustomTemplateAd!) {
        Log.sharedInstance.logInformation("[\(self.advertisementId)] Loaded: [\(nativeCustomTemplateAd.templateID)] for [\(self.unit)]")// Ad [\(nativeCustomTemplateAd)]")
        
        //
        // Errors did NOT occur until I added this code....
        //
        for keyObject in nativeCustomTemplateAd.availableAssetKeys {
            if let key = keyObject as? String {
                let value = nativeCustomTemplateAd.stringForKey(key)
                print("[\(self.advertisementId)] Native Data [\(key)] -> [\(value)]")
            }
        }
    }
    
    /// Called when adLoader fails to load an ad.
    func adLoader(adLoader: GADAdLoader!, didFailToReceiveAdWithError error: GADRequestError!) {
        
        Log.sharedInstance.logInformation("[\(self.advertisementId)] Failed: \(error)")
    }
    
}
