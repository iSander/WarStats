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
    
    func configure(with dict: Dictionary<String, AnyObject>?, previous: Equipment?) {
        let number = dict?.values.first as? Int ?? 0
        numberLabel.text = String(number)
        nameLabel.text = dict?.keys.first
        
        if let previous = previous {
            for element in previous.array {
                if let numberPrevious = element[nameLabel.text ?? ""] as? Int {
                    let delta = number - numberPrevious
                    
                    if delta > 0 {
                        deltaLabel.text = "+\(delta)"
                    }
                    else {
                        deltaLabel.isHidden = true
                    }
                }
            }
        }
    }
}
