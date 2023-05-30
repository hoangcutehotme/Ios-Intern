//
//  TitleTableViewCell.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
    }
    
    func generateCell(title: String) {
        textLabel?.text = title
    }
}
