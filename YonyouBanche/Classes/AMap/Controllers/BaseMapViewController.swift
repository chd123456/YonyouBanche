//
//  BaseMapViewController.swift
//  YonyouBanche
//
//  Created by myway on 16/4/21.
//  Copyright © 2016年 认识无情也动人. All rights reserved.
//

import UIKit
import Foundation
import SnapKit

protocol mySearchAPI {
    func getApplicationName() -> String 
    
//    - (NSString *)getApplicationName
//    {
//    NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
//    return [bundleInfo valueForKey:@"CFBundleDisplayName"] ?: [bundleInfo valueForKey:@"CFBundleName"];
//    }
//    
//    - (NSString *)getApplicationScheme
//    {
//    NSDictionary *bundleInfo    = [[NSBundle mainBundle] infoDictionary];
//    NSString *bundleIdentifier  = [[NSBundle mainBundle] bundleIdentifier];
//    NSArray *URLTypes           = [bundleInfo valueForKey:@"CFBundleURLTypes"];
//    
//    NSString *scheme;
//    for (NSDictionary *dic in URLTypes)
//    {
//    NSString *URLName = [dic valueForKey:@"CFBundleURLName"];
//    if ([URLName isEqualToString:bundleIdentifier])
//    {
//    scheme = [[dic valueForKey:@"CFBundleURLSchemes"] objectAtIndex:0];
//    break;
//    }
//    }
//    
//    return scheme;
//    }

}

class BaseMapViewController: UIViewController ,MAMapViewDelegate,AMapSearchDelegate{
    
    var _isFirstAppear = true
    
    let mapView = MAMapView()
    let search  = AMapSearchAPI()
    
 
    /**
     hook,子类覆盖它,实现想要在viewDidAppear中执行一次的方法,搜索中有用到
     */
    func hookAction() {
        
    }
    //MARK: - 返回方法
    func backAction() {
        navigationController?.popViewControllerAnimated(true)
        clearMapView()
    }
    //MARK: - Utility
    func clearMapView()  {
        mapView.showsUserLocation = false
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        mapView.delegate = nil;
    }

//    //MARK: - Initialization
    func initMapView()  {
//        mapView.frame = view.bounds
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
    }
    func initBaseNavigationBar()  {
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BaseMapViewController.backAction))
        
    }
    func initTitle(title: String?)  {
        let titleLabel  = UILabel.init()
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.text =  title
        titleLabel.sizeToFit()
        
        self.navigationItem.titleView = titleLabel
        
    }
    

    //MARK: - 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = UIRectEdge.None;
        initTitle(title)
        initBaseNavigationBar()
        initMapView()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if _isFirstAppear {
            mapView.visibleMapRect = MAMapRectMake(220880104, 101476980, 272496, 466656)
            _isFirstAppear = false
        }
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(true, animated: animated)
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
