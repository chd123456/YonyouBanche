//
//  BusLineViewController.swift
//  YonyouBanche
//
//  Created by 任是无情也动人 on 16/4/22.
//  Copyright © 2016年 认识无情也动人. All rights reserved.
//

import UIKit

class BusLineViewController: BaseMapViewController {



    
    func mapTypeAction(segmentedControl: UISegmentedControl)  {
        
            mapView.mapType = MAMapType.init(rawValue: segmentedControl.selectedSegmentIndex)!
    }
    func initToolBar() {
        let flexbleItem = UIBarButtonItem.init(
            barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace,
            target: self,
            action: nil)
        
        let mapTypeSegmentedControl = UISegmentedControl.init(items: ["标准(Standard)","卫星(Satellite)"])
        
        mapTypeSegmentedControl.selectedSegmentIndex = mapView.mapType.rawValue
        mapTypeSegmentedControl.addTarget(self, action: #selector(BusLineViewController.mapTypeAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
       
        let mayTypeItem = UIBarButtonItem.init(customView: mapTypeSegmentedControl)
        
        toolbarItems = [flexbleItem,mayTypeItem,flexbleItem];
        
        
    }
    
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        initTitle("用友班车")
        initToolBar()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.toolbar.barStyle = UIBarStyle.BlackOpaque
        navigationController?.toolbar.translucent = true
        navigationController?.setToolbarHidden(false, animated: true)

        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        mapView.mapType = MAMapType.Standard
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
