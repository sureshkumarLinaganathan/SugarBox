//
//  HomeItemCell.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

class HomeItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel:HomeItemCellViewModel? {
        didSet {
            setup()
        }
    }
    
    func setup() {
        
        ImageCache.shared.loadImage(urlStr: viewModel?.imageUrl ?? "") { image in
            if let image = image {
                self.imageView.image = image
            }
        }
    }
    
}
