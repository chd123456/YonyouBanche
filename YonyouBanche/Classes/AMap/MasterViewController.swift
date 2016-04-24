//
//  MasterViewController.swift
//  YonyouBanche
//
//  Created by myway on 16/4/17.
//  Copyright © 2016年 认识无情也动人. All rights reserved.
//

import UIKit
import Alamofire
class MasterViewController: UITableViewController {


    @IBOutlet weak var titleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationItem.titleView = titleImageView
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if let detailViewController = segue.destinationViewController as? DetailTableViewController
        
        {
            func requestForSegue(segue: UIStoryboardSegue) -> Request?{
                switch segue.identifier! {
                case "GET":
                    detailViewController.segueIdentifier = "GET"
                    return Alamofire.request(.GET, "https://httpbin.org/get")//http://10.2.128.25:8000/travel/train2/#booking
                case "POST":
                    detailViewController.segueIdentifier = "POST"
                    return Alamofire.request(.POST, "https://httpbin.org/post")
                case "PUT":
                    detailViewController.segueIdentifier = "PUT"
                    return Alamofire.request(.PUT, "https://httpbin.org/put")
                case "DELETE":
                    detailViewController.segueIdentifier = "DELETE"
                    return Alamofire.request(.DELETE, "https://httpbin.org/delete")
                case "DOWNLOAD":
                    detailViewController.segueIdentifier = "DOWNLOAD"
                    let destination = Alamofire.Request.suggestedDownloadDestination(
                        directory: .CachesDirectory,
                        domain: .UserDomainMask
                    )
                    return Alamofire.download(.GET, "https://httpbin.org/stream/1", destination: destination)
                default:
                    return nil
                }
            }
            
            if let request = requestForSegue(segue)
            {
                detailViewController.request = request
            }
            
        }
    }
    

}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    //    class func leftViewController() -> HGSidePanelViewController? {
    //        return mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? HGSidePanelViewController
    //    }
    //
    //
    //    class func tabbarViewController() -> HGTabBarViewController? {
    //        return mainStoryboard().instantiateViewControllerWithIdentifier("HGTabBarViewController") as? HGTabBarViewController
    //    }
    
}
