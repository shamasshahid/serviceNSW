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
        expiryLabel.text = viewModel.expiryDate
        carDetailLabel.text = viewModel.makeModelDetail
    }
}
