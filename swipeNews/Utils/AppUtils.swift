//
//  AppUtils.swift
//  swipeNews
//
//  Created by webwerks on 09/07/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD


class AppUtils {
    
    static var sharedInstance = AppUtils()
    
    func showHUD(){
        
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultMaskType(.gradient)
            SVProgressHUD.setBackgroundColor(UIColor.white)
            SVProgressHUD.setForegroundColor(UIColor.red)
            SVProgressHUD.setRingThickness(2.0)
            SVProgressHUD.show()
        }
    }
    
    func dismissHUD(){
        SVProgressHUD.dismiss()
    }
    
    //display controller
    func ShowAlertWith(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    static func registerNibForTableViewCellWith(CellIdentifier:String, forTableView:UITableView) {
        forTableView.register(UINib(nibName: CellIdentifier, bundle: nil), forCellReuseIdentifier: CellIdentifier)
        
    }
    
    func timeAgoDateFromString(dateString:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: dateString){
            
            let timeAgoString = timeAgoSince(date)
            
            return timeAgoString
        }else{
            return "noDate"
        }
        
    }
    
}

