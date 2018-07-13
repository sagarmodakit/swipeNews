//
//  NewsFeedViewModel.swift
//  swipeNews
//
//  Created by webwerks on 13/07/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper


class NewsFeedViewModel{
    
    var newsFeedData : [NewsData]           = [NewsData]()
    let disposeBag                              = DisposeBag()
    typealias CompletionHandler = (_ temp: String)->()
    

    func fetchNewsWithParameters(searchString:String?, completion: @escaping CompletionHandler){
        
        APP_UTILS.showHUD()
        
        NewsFeedFactory.newsFeedApiWithParameters(searchString: searchString).subscribe(onNext: { (responseObject) in
            if responseObject.status! == kStatusOK {
                APP_UTILS.dismissHUD()
                
                if let responseData = responseObject.articles {
                    self.newsFeedData = responseData
                    completion(responseObject.status!)
                }else{
                    completion(responseObject.status!)
                }
                
            }else{
                APP_UTILS.dismissHUD()
                APP_UTILS.ShowAlertWith(title: responseObject.errorCode!, message: responseObject.message!)
            }
        }).disposed(by: disposeBag)
        
    }
    
    
    func numberOfCards() -> Int{
        return newsFeedData.count
    }
    func newsForCard(ind: Int) -> NewsData{
        return newsFeedData[ind]
    }


}
