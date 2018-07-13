//
//  NewsFeed.swift
//  swipeNews
//
//  Created by webwerks on 13/07/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import Foundation
import ObjectMapper


class NewsFeed : Mappable{
    
    var status:                     String?
    var message:                    String?
    var errorCode:                       String?
    var totalResults :              Int?
    var articles:                   [NewsData]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        status              <- map["status"]
        message             <- map["message"]
        errorCode           <- map["code"]
        totalResults        <- map["totalResults"]
        articles            <- map["articles"]
        
    }

}

class NewsData : Mappable{
    
    var author:              String?
    var title:               String?
    var description:         String?
    var linkToArticle:       String?
    var imageUrl:            String?
    var publishDateTime:     String?
    var source:              Source?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        author              <- map["author"]
        title               <- map["title"]
        description         <- map["description"]
        linkToArticle       <- map["url"]
        imageUrl            <- map["urlToImage"]
        publishDateTime     <- map["publishedAt"]
        source              <- map["source"]
    }
}

class Source : Mappable {
    
    var id:                 String?
    var sourceName:         String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id                 <- map["id"]
        sourceName         <- map["name"]
    }
    
}
