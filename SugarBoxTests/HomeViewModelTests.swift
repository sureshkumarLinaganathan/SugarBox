//
//  HomeViewModelTests.swift
//  SugarBoxTests
//
//  Created by Suresh Kumar Linganathan on 22/10/23.
//

import XCTest
@testable import SugarBox

final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockAPIService: MockServices!
    override func setUpWithError() throws {
        mockAPIService = MockServices()
        viewModel = HomeViewModel(service: mockAPIService)
    }
    
    override func tearDownWithError() throws {
        mockAPIService = nil
        viewModel = nil
    }
    
    func test_fetch_feeds() {
        mockAPIService.responseType = .success
        viewModel.fetchFeeds()
        XCTAssertNotNil(viewModel.feed)
    }
    
    func test_fetch_feeds_failure() {
        mockAPIService.responseType = .failure
        viewModel.fetchFeeds()
        XCTAssertNil(viewModel.feed)
        XCTAssertEqual(viewModel?.message, "Something went wrong!")
    }
    
    func test_fetch_feed_failure_without_msg() {
        mockAPIService.responseType = .failureWithOutMsg
        viewModel?.fetchFeeds()
        XCTAssertEqual(viewModel?.message, "")
    }
    
    func test_noOfSection() {
        let section = viewModel.noOfSection
        XCTAssertEqual(section, 2)
    }
    
    func test_carosual_DataSource() {
        mockAPIService.responseType = .success
        viewModel.fetchFeeds()
        XCTAssertEqual(viewModel.carousalDataSource.count, 1)
    }
    
    func test_widget_DataSource() {
        mockAPIService.responseType = .success
        viewModel.fetchFeeds()
        XCTAssertEqual(viewModel.widgetDataSource.count, 1)
    }
    
    
    
}
