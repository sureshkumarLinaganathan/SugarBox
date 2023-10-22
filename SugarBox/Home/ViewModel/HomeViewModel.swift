//
//  HomeViewModel.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func reload()
    func showMessgage()
    func startActivityIndicator()
    func stopActivityIndicator()
}

class HomeViewModel: NSObject {
    
    weak var delegate: HomeViewModelProtocol?
    let service: ServiceProviderProtocol
    let limit = 20
    var skip = 1
    var carousalDataSource = [Content]()
    var widgetDataSource = [Content]()
    var message:String?
    
    var feed:Feed? {
        didSet {
            filterDataSource()
        }
    }
    
    init(service: ServiceProviderProtocol = ServiceProvider() ){
        self.service = service
    }
    
    func fetchFeeds() {
        self.delegate?.startActivityIndicator()
        service.fetchFeeds(pageNo:skip, limit: limit) { [weak self] response in
            self?.feed = response as? Feed
            self?.delegate?.reload()
            self?.delegate?.stopActivityIndicator()
        } failureCallback: {[weak self] message in
            self?.message = message
            self?.delegate?.stopActivityIndicator()
        }
    }
    
    func filterDataSource() {
        carousalDataSource = self.feed?.data.filter{$0.designSlug == "CarousalWidget"} ?? []
        widgetDataSource = self.feed?.data.filter{$0.designSlug == "OTTWidget"} ?? []
    }
    
}
