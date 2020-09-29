//
//  RegistrationWeightTableViewCell.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import UIKit

class RegistrationWeightTableViewCell: UITableViewCell, RegistrationDetailCell {

    static var cellIdentifier: String {
        return String(describing: RegistrationWeightTableViewCell.self)
    }

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    var viewModel: RegistrationDetailCellViewModel! {
        didSet {
            updateView()
        }
    }

    func updateView() {
        weightLabel.text = viewModel.weight
        massLabel.text = viewModel.mass
    }
}
