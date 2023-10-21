//
//  HomeViewModel.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    
}

class HomeViewModel: NSObject {
    
    weak var delegate: HomeViewModelProtocol?
    let service: ServiceProviderProtocol
    var limit = 20
    var skip = 1
    
    init(service: ServiceProviderProtocol = ServiceProvider() ){
        self.service = service
    }
    
    func fetchFeeds() {
        service.fetchFeeds(pageNo:skip, limit: limit) { response in
            
        } failureCallback: { message in
            
        }
    }
    
}
