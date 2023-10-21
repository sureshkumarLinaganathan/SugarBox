//
//  HomeItemCellViewModel.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 22/10/23.
//

import UIKit

class HomeItemCellViewModel {
    
    let subContent: SubContent
    
    init(subContent: SubContent) {
        self.subContent = subContent
    }
    
    var imageUrl: String {
        
        let assets = subContent.assets.filter{$0.assetType == "IMAGE"}
        if let asset = assets.first {
            return "https://static01.sboxdc.com/images"+asset.sourcePath
        }
        
        return ""
    }
    
}
