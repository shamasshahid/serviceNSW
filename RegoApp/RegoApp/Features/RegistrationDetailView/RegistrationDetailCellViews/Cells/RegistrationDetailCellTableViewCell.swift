//
//  RegistrationDetailCellTableViewCell.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import UIKit

protocol RegistrationDetailCell {
    var viewModel: RegistrationDetailCellViewModel! { get set }
}

class RegistrationDetailTableViewCell: UITableViewCell, RegistrationDetailCell {

    static let blueLabelColor = "blueLabel"
    
    @IBOutlet weak var plateNumberLabel: UILabel!
    @IBOutlet weak var makeModelLabel: UILabel!
    @IBOutlet weak var registrationExpiryLabel: UILabel!
    @IBOutlet weak var vinLabel: UILabel!
    
    static var cellIdentifier: String {
        return String(describing: RegistrationDetailTableViewCell.self)
    }
    
    var viewModel: RegistrationDetailCellViewModel! {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        plateNumberLabel.text = viewModel.plateNumber
        makeModelLabel.text = viewModel.makeModelDetail
        vinLabel.text = viewModel.vinDetail
        registrationExpiryLabel.text = viewModel.expiryDate
        registrationExpiryLabel.textColor = viewModel.isExpired ? UIColor.red : UIColor(named: RegistrationDetailTableViewCell.blueLabelColor)
    }
}
