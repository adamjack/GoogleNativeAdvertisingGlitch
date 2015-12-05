//
//  ViewController.swift
//  GoogleNativeAdvertisingGlitch
//
//  Created by Adam R. B. Jack on 12/4/15.
//  Copyright © 2015 Testing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView   : UITableView!
    
    var contexts    = [AdvertisingNativeContext]()
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView = self.view.viewWithTag(1) as! UITableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.estimatedRowHeight = 50
        
        // Listen for log changes...
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "logUpdated:", name: "Information", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func logUpdated(sender:AnyObject) {
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var ad = 0
        
        
        Log.sharedInstance.logInformation("Getting started requesting...")
        
        for _ in 0...5 {
            let context = AdvertisingNativeContext(viewController: self, unit: DfpConfigConstant.Unit1, advertisementId:ad++)
            context.load()
            contexts.append(context)
        }
        
        Log.sharedInstance.logInformation("Ads requested...")

        // Code commented out as not needed to reproduce symptom...
        /*
        for _ in 0...5 {
            let context = AdvertisingNativeContext(viewController: self, unit: DfpConfigConstant.Unit2, advertisementId:ad++)
            context.load()
            contexts.append(context)
        }
        */
        /*
        for _ in 0...5 {
            let context = AdvertisingNativeContext(viewController: self, unit: DfpConfigConstant.Unit1, advertisementId:ad++)
            context.load()
            contexts.append(context)
        }
        
        for _ in 0...5 {
            let context = AdvertisingNativeContext(viewController: self, unit: DfpConfigConstant.Unit2, advertisementId:ad++)
            context.load()
            contexts.append(context)
        }
        */
    }

}

extension ViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Log.sharedInstance.information.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Information", forIndexPath: indexPath)
        
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = Log.sharedInstance.information[indexPath.row]
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

