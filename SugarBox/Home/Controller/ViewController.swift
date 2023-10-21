//
//  ViewController.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindWithViewModel()
        fethcFeeds()
        
    }
    
    func bindWithViewModel() {
        viewModel.delegate = self
    }
    
    func fethcFeeds() {
        viewModel.fetchFeeds()
    }
    
}

extension ViewController: HomeViewModelProtocol {
    
}

