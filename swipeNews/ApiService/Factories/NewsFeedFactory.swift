//
//  NewsFeedFactory.swift
//  swipeNews
//
//  Created by webwerks on 09/07/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class NewsFeedFactory {
    
    class func newsFeedApiWithParameters<T: NewsFeed>(searchString:String?) -> Observable<T>{
        
        var parameters: Parameters = [:]
        
        parameters = [kApiKeyParameter : Constants.apiKey, kCountryParameter : "in"]
        
        let url = ApiModel.URLforPath(path: topHeadlinesEndpoint)
        let type:HTTPMethod = .get
        
        return ApiService.fetchObject(methodType: type, url: url, inputParameter: parameters)
    }
    
    
}
