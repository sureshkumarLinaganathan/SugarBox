//
//  HomeItemCellViewModelTests.swift
//  SugarBoxTests
//
//  Created by Suresh Kumar Linganathan on 22/10/23.
//

import XCTest
@testable import SugarBox

final class HomeItemCellViewModelTests: XCTestCase {
    
    var viewModel: HomeItemCellViewModel!
    
    override func setUpWithError() throws {
        let subContent = SubContent(assets: [Asset(assetType: "IMAGE", sourceUrl: "http://zee5.origin03", type: "", sourcePath: "/zee5/806fcbd9-8573-4172-bd68-69a0b34c3405/resources/0-6-2922/list/270x152/062922inlist.jpg")], contentType: "Show", description: "Churails is an Urdu")
        viewModel = HomeItemCellViewModel(subContent: subContent)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_subContent_Not_Nil() {
        XCTAssertNotNil(viewModel.subContent)
    }
    
    func test_image_url() {
        let url = viewModel.imageUrl
        XCTAssertEqual(url, "https://static01.sboxdc.com/images/zee5/806fcbd9-8573-4172-bd68-69a0b34c3405/resources/0-6-2922/list/270x152/062922inlist.jpg")
    }
}
