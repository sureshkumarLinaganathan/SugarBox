//
//  HomeViewController.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindWithViewModel()
        registerCell()
        fethcFeeds()
    }
    
    private func bindWithViewModel() {
        viewModel.delegate = self
    }
    
    private func fethcFeeds() {
        viewModel.fetchFeeds()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: HomeWidgetCell.identifier, bundle: nil), forCellReuseIdentifier: HomeWidgetCell.identifier)
        tableView.register(UINib(nibName: HomeCarouselCell.identifier, bundle: nil), forCellReuseIdentifier: HomeCarouselCell.identifier)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.noOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.carousalDataSource.count
        }
        return viewModel.widgetDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell: HomeCarouselCell = tableView.dequeueReusableCell(withIdentifier: HomeCarouselCell.identifier, for: indexPath) as! HomeCarouselCell
            let cellViewModel = HomeCellViewModel(content: viewModel.carousalDataSource[indexPath.row])
            cell.viewModel = cellViewModel
            return cell
        }
        
        let cell: HomeWidgetCell = tableView.dequeueReusableCell(withIdentifier: HomeWidgetCell.identifier , for: indexPath) as! HomeWidgetCell
        let cellViewModel = HomeCellViewModel(content: viewModel.widgetDataSource[indexPath.row])
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        return 150
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func reload() {
        self.tableView.reloadData()
    }
    
    func showMessgage() {
        let alert = UIAlertController(title: "", message: viewModel.message ?? "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    func startActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}

