//
//  HomeCellViewModelTests.swift
//  SugarBoxTests
//
//  Created by Suresh Kumar Linganathan on 22/10/23.
//

import XCTest
@testable import SugarBox

final class HomeCellViewModelTests: XCTestCase {
    
    var viewModel: HomeCellViewModel!

    override func setUpWithError() throws {
        let content = Content(description: "Zee5 Carousel", title: "Trending Movies on Air", contents: [SubContent(assets: [Asset(assetType: "IMAGE", sourceUrl: "http://zee5.origin03", type: "", sourcePath: "thumbnail_list")], contentType: "Show", description: "Churails is an Urdu")], designSlug: "CarousalWidget")
        
        viewModel = HomeCellViewModel(content: content)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_title() {
        let title = viewModel.title
        XCTAssertEqual(title, "Trending Movies on Air")
    }
    
    func test_subContent_Not_Nil() {
        let subcontent = viewModel.subContent
        XCTAssertNotNil(subcontent)
    }
    
    func test_rowcount() {
        let count = viewModel.rowCount
        XCTAssertEqual(count, 1)
    }

}
