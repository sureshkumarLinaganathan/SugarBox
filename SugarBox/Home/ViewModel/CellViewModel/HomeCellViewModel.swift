//
//  HomeCellViewModel.swift.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 22/10/23.
//

import UIKit

class HomeCellViewModel {
    
    let content: Content
    
    init(content: Content) {
        self.content = content
    }
    
    var title: String {
        self.content.title
    }
    
    var subContent: [SubContent] {
        self.content.contents
    }
    
    var rowCount: Int {
        self.content.contents.count
    }
    
}
