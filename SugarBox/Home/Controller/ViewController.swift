//
//  ViewController.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindWithViewModel()
        registerCell()
        fethcFeeds()
    }
    
    func bindWithViewModel() {
        viewModel.delegate = self
    }
    
    func fethcFeeds() {
        viewModel.fetchFeeds()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "HomeWidgetCell", bundle: nil), forCellReuseIdentifier: "HomeWidgetCell")
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.widgetDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeWidgetCell = tableView.dequeueReusableCell(withIdentifier: "HomeWidgetCell" , for: indexPath) as! HomeWidgetCell
        let cellViewModel = HomeWidgetCellViewModel(content: viewModel.widgetDataSource[indexPath.row])
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ViewController: HomeViewModelProtocol {
    func reload() {
        self.tableView.reloadData()
    }
    
    func showMessgage() {
        
    }
}

