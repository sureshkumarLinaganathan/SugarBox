//
//  ServiceProvider.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

protocol ServiceProviderProtocol {
    
    func fetchFeeds(pageNo: Int, limit: Int,successCallback:@escaping successCallback,failureCallback:@escaping failureCallback)
    
}

class  ServiceProvider: ServiceProviderProtocol {
    
    
    func fetchFeeds(pageNo: Int, limit: Int, successCallback: @escaping successCallback, failureCallback: @escaping failureCallback) {
        
        ApiManager.fetchFeeds(pageNo: pageNo, limit: limit) { response in
            successCallback(response)
        } failureCallback: { message in
            failureCallback(message)
        }
        
    }
    
}
