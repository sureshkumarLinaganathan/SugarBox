//
//  ApiManager.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import Foundation

class ApiManager {
    
    class func fetchFeeds(pageNo: Int, limit: Int, successCallback: @escaping successCallback, failureCallback: @escaping failureCallback) {
        
        let (url,headers) = WebServiceConfig.getUrlWithHeaders(forActionType:.fetchFeeds, forHeaderType:.basic, queryString:["page":String(pageNo),"perPage":String(limit)], apiType:.firstVersion,paths:nil)
        
        _ = WebService.initiateServiceCall(headers: headers, withMethod: .get, urlStr: url, requestObj: nil, successCallBack: { response in
            
            guard let data = response as? Data else{
                DispatchQueue.main.async {
                    failureCallback("Incorrect data format.")
                }
                return
            }
            
            let objs = Parser.decode(data: data, type: Feed.self)
            successCallback(objs)
        }, failureCallback: { message in
            
        })
    }
    
}
