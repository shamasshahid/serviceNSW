//
//  RegistrationInsurerTableViewCell.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import UIKit

class RegistrationInsurerTableViewCell: UITableViewCell, RegistrationDetailCell {
    
    static var cellIdentifier: String {
        return String(describing: RegistrationInsurerTableViewCell.self)
    }
    
    @IBOutlet weak var insurerName: UILabel!
    var viewModel: RegistrationDetailCellViewModel! {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        insurerName.text = viewModel.insurerName
    }
}
