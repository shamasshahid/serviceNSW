//
//  ViewController.swift
//  RegoApp
//
//  Created by Shamas on 28/9/20.
//

import UIKit

enum SegueIdentiifers: String {
    case registrationDetail = "registrationDetailSegue"
}

class RegistrationsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RegistrationsListViewModel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        viewModel = RegistrationsListViewModel(router: DependencyProvider.getRouter(),
                                               service: DependencyProvider.getService())
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func setupViewModel() {
        
        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.requestData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? RegistrationDetailViewController, let viewModel = sender as? RegistrationDetailViewModel {
            detailVC.viewModel = viewModel
        }
    }
}

extension RegistrationsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RegistrtaionTableViewCell.rowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RegistrtaionTableViewCell.cellIdentifier, for: indexPath)
        
        if let registrationCell = cell as? RegistrtaionTableViewCell {
            registrationCell.viewModel = viewModel.getRegistrationViewModel(index: indexPath.row)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewModel = viewModel.getRegistrationDetailViewModel(index: indexPath.row)
        performSegue(withIdentifier: SegueIdentiifers.registrationDetail.rawValue, sender: detailViewModel)
    }
}

