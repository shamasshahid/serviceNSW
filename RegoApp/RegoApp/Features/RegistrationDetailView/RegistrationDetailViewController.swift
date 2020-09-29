//
//  RegistrationDetailViewController.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import UIKit

enum DetailCells: Int {
    
    case registrationDetail = 0
    case insuranceDetail = 1
    case weightDetail = 2
    
    var cellIdentifier: String {
        switch self {
        case .registrationDetail:
            return RegistrationDetailTableViewCell.cellIdentifier
        case .insuranceDetail:
            return RegistrationInsurerTableViewCell.cellIdentifier
        default:
            return RegistrationDetailTableViewCell.cellIdentifier
        }
    }
}

class RegistrationDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RegistrationDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension RegistrationDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellType = DetailCells(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath)
        
        if var detailCell = cell as? RegistrationDetailCell {
            detailCell.viewModel = viewModel.getDetailCellViewModel()
        }
        
        return cell
    }
}
