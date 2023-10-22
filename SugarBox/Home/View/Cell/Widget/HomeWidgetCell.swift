//
//  HomeWidgetCell.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

class HomeWidgetCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel:HomeCellViewModel? {
        didSet {
            setup()
        }
    }
    
    func setup() {
        titleLabel.text = viewModel?.title
        registerCell()
        self.setupCollectionView()
    }
    
    func registerCell() {
        collectionView.register(UINib(nibName: "HomeItemCell", bundle: nil), forCellWithReuseIdentifier: "HomeItemCell")
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
}

extension HomeWidgetCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.subContent.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: HomeItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeItemCell", for: indexPath) as! HomeItemCell
        if let viewModel = viewModel  {
            let cellViewModel = HomeItemCellViewModel(subContent: viewModel.subContent[indexPath.row])
            cell.viewModel = cellViewModel
        }
        
        return cell
        
    }
}

extension HomeWidgetCell:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.size
        let width = (size.width/3)
        return CGSize(width: width, height: 100)
    }
}
