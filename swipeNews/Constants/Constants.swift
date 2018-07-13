//
//  Constants.swift
//  swipeNews
//
//  Created by webwerks on 09/07/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class Constants {
    
    static let baseURL = "https://newsapi.org/v2"
    
    static let errorMessage : PublishSubject = PublishSubject<String>()
    
    static let apiKey = "a56a0219ea6b4bd08bd3e9899fce3aa1"
    
}

let APP_UTILS = AppUtils.sharedInstance

// api endPoints
let topHeadlinesEndpoint = "/top-headlines"

// parameters
let kCountryParameter = "country"
let kApiKeyParameter = "apiKey"
let kStatusOK = "ok"
let kStatusERROR = "error"



//cell identifiers


// imageNames

