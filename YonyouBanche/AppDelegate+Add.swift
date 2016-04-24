//
//  AppDelegate+Add.swift
//  YonyouBanche
//
//  Created by myway on 16/4/14.
//  Copyright © 2016年 认识无情也动人. All rights reserved.
//

import Foundation


let APIKey = "150362fb7da48a2bdf51e237cb5b4276"
extension AppDelegate{
    
        // MARK: - Request
    /**
     设置高德地图apiKey
     */
    func setAmapKey() {
       
        MAMapServices.sharedServices().apiKey = APIKey
        AMapSearchServices.sharedServices().apiKey = APIKey
        
    }
    // MARK: -
}