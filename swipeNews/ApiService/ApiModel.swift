//
//  ApiModel.swift
//  swipeNews
//
//  Created by webwerks on 09/07/18.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation

class ApiModel {
    
    class func URLforPath(path: String) -> URL{ path
      
        let urlString = Constants.baseURL
        
        let apiPath = urlString + path
        
        return URL(string: "\(apiPath)")!
    }
}
