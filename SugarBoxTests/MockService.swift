//
//  MockService.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import Foundation
@testable import SugarBox

class MockServices:ServiceProviderProtocol {
    
    var responseType:MockApiResponseType = .success
    
    func fetchFeeds(pageNo: Int, limit: Int, successCallback: @escaping successCallback, failureCallback: @escaping failureCallback) {
        
        switch responseType {
            
        case .success:
            
            let data = Feed(data: [Content(description: "Zee5 Carousel", title: "Trending Movies on Air", contents: [SubContent(assets: [Asset(assetType: "IMAGE", sourceUrl: "http://zee5.origin03", type: "", sourcePath: "thumbnail_list")], contentType: "Show", description: "Churails is an Urdu ")], designSlug: "CarousalWidget"), Content(description: "Zee5 Carousel", title: "Trending Movies on Air", contents: [SubContent(assets: [Asset(assetType: "IMAGE", sourceUrl: "http://zee5.origin03", type: "", sourcePath: "thumbnail_list")], contentType: "Show", description: "Churails is an Urdu ")], designSlug: "OTTWidget")])
            successCallback(data as AnyObject)
            
        case .failure:
            
            failureCallback("Something went wrong!")
            
        case .successWithEmptyData:
            
            successCallback([] as AnyObject)
            
        case .failureWithOutMsg:
            failureCallback("")
        default:
            failureCallback("Request Time out")
        }
        
    }
}

enum MockApiResponseType {
    
    case success
    case failure
    case successWithEmptyData
    case failureWithOutMsg
    case reloadStatus
    case timeOut
}


