//
//  ApiService.swift
//  swipeNews
//
//  Created by webwerks on 09/07/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Alamofire
import ObjectMapper
import RxSwift
import Foundation


class ApiService {
    static let disposeBag = DisposeBag()
    
    /*
    //get JSON response
    class func fetch(methodType : HTTPMethod? = .post, url: URL, parameter:[String: Any]? = nil ) -> Observable<Any>{
        
        return Observable.create({ (observable) in
            
            Alamofire.request(url, method: methodType!, parameters: parameter, encoding: URLEncoding.methodDependent, headers: Constants.HTTPHeaders).responseJSON { (response) in
                
                switch response.result{
                case .success:
                    debugPrint(response)
                    var jsonValue : [String: Any]?
                    if let  responseValue = response.result.value as? [String: Any]?{
                        jsonValue = responseValue
                    }
                    if (jsonValue?["status"] as? Int == 1){
                         observable.onNext(jsonValue!)
                    }
                    else{
                        let message = jsonValue?["message"]
                        Constants.errorMessage.onNext(message as! String)
                    }
                    
                case .failure(let error):
                    let errorMessage = error.localizedDescription
                    print(errorMessage)
                    Constants.errorMessage.onNext(errorMessage)
                }
            }
            return  Disposables.create {
                print("Disposed")
            }
        })
    }*/
    
    //get object of JSON response
    class func fetchObject<T: Mappable>(methodType : HTTPMethod, url: URL, inputParameter:[String: Any]? = nil ) -> Observable<T>{
        
        return Observable.create({ (observable) in
            
           
            Alamofire.request(url, method: methodType, parameters: inputParameter, encoding: URLEncoding.methodDependent, headers: nil).responseJSON { (response) in
                
                switch response.result{
                case .success:
                    debugPrint(response)
                    
                    if let  responseValue = response.result.value as? [String: Any]?{
                        let model = Mapper<T>().map(JSON: responseValue!)
                        observable.onNext(model!)
                     }
                case .failure(let error):
                    let errorMessage = error.localizedDescription
                    print(errorMessage)
                    Constants.errorMessage.onNext(errorMessage)
                }
            }
            return  Disposables.create {
                print("Disposed")
            }
        })
    }
}








