//
//  HomeCarouselCell.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 22/10/23.
//

import UIKit

class HomeCarouselCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var viewModel: HomeCellViewModel? {
        didSet {
            setup()
        }
    }
    
    func setup() {
        setupCollectionView()
        registerCell()
        setupPageControl()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "HomeCarouselItemCell", bundle: nil), forCellWithReuseIdentifier: "HomeCarouselItemCell")
    }
    
    private func setupPageControl() {
        self.pageControl.numberOfPages = viewModel?.rowCount ?? 0
    }
}

extension HomeCarouselCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.rowCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:HomeCarouselItemCell = collectionView.dequeueReusableCell(withReuseIdentifier:"HomeCarouselItemCell", for: indexPath) as! HomeCarouselItemCell
        if let viewModel = viewModel  {
            let cellViewModel = HomeItemCellViewModel(subContent: viewModel.subContent[indexPath.row])
            cell.viewModel = cellViewModel
        }
        return cell
    }
    
}

extension HomeCarouselCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.size
        return CGSize(width: size.width, height: 150)
    }
    
}

extension HomeCarouselCell: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

