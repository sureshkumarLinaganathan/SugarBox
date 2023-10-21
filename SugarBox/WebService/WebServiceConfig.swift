//
//  WebServiceConfig.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

enum HttpMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum UrlVersionType: String{
    case firstVersion = "v1"
}

enum ActionType : String {
    
    case fetchFeeds = "ecm/v2/super/feeds/zee5-home/details"
}

struct ApiUrl {
    mutating func getBaseUrl(type: UrlVersionType)->String{
        switch type {
        
        default:
            return ApiIP.appIP_v1
        }
    }
}

struct ApiIP {
    static let appIP_v1 = "https://apigw.sboxdc.com/"
}

enum APIHeadersType {
    case basic
}

class WebServiceConfig {
    
    static let shared : WebServiceConfig = WebServiceConfig.init()
    
    class func requestHeaders(type: APIHeadersType) -> [String: String]? {
        switch type {
        case .basic:
            return ["Content-Type": "application/json"]
        }
    }
    
    class  func getUrlWithHeaders(forActionType type: ActionType, forHeaderType htype: APIHeadersType, queryString:[String:String], apiType: UrlVersionType,paths:[String]?) -> (String, [String: String]?) {
        let headerDict = WebServiceConfig.requestHeaders(type: htype)
        var apiUrl = ApiUrl()
        var baseUrl = apiUrl.getBaseUrl(type: apiType)
        
        if let arrPaths = paths{
            baseUrl += createPath(array:arrPaths)
        }
        baseUrl += type.rawValue
        if queryString.count > 0{
            baseUrl += WebServiceConfig.createQueryString(dict:queryString)
        }
        return (baseUrl,headerDict)
    }
    
    class func createQueryString(dict:[String:String])->String{
        var queryStr = "?"
        var count = 0
        for (key, value) in dict{
            if count >= 1{
                queryStr += "&"
            }
            queryStr = queryStr+key+"="+value
            count = count+1
        }
        return queryStr
    }
    
    class func createPath(array:[String])->String{
        
        var pathStr = ""
        var count = 0
        for str in array{
            
            if count >= 1{
                pathStr += "/"
            }
            pathStr += str
            count += 1
        }
        return pathStr
    }
}


