//
//  RegistrtaionTableViewCell.swift
//  RegoApp
//
//  Created by Shamas on 28/9/20.
//

import UIKit

class RegistrtaionTableViewCell: UITableViewCell {

    static var cellIdentifier: String {
        return String(describing: RegistrtaionTableViewCell.self)
    }
    
    static let blueLabelColor = "blueLabel"
    
    static let rowHeight: CGFloat = 100
    
    @IBOutlet weak var plateNumberLabel: UILabel!
    @IBOutlet weak var carDetailLabel: UILabel!
    @IBOutlet weak var expiryLabel: UILabel!
    
    var viewModel: RegistrationCellViewModel! {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        plateNumberLabel.text = viewModel.plateNumber
        carDetailLabel.text = viewModel.makeModelDetail
        expiryLabel.text = viewModel.expiryDate
        if viewModel.isExpired {
            expiryLabel.textColor = UIColor.red
        } else {
            expiryLabel.textColor = UIColor(named: RegistrtaionTableViewCell.blueLabelColor)
        }
    }
}
