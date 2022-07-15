//
//  EquipmentCollectionViewCell.swift
//  WarStats
//
//  Created by Alex Sander on 14.07.2022.
//

import UIKit

class EquipmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var deltaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with dict: Dictionary<String, AnyObject>?) {
        numberLabel.text = String(dict?.values.first as? Int ?? 0)
        nameLabel.text = dict?.keys.first
    }
}
