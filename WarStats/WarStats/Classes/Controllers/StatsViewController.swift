//
//  StatsViewController.swift
//  WarStats
//
//  Created by Alex Sander on 14.07.2022.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var personnelLabel: UILabel!
    @IBOutlet weak var powLabel: UILabel!
    
    @IBOutlet weak var equipmentCollectionView: UICollectionView!
    
    var personnel: Personnel?
    var equipment: Equipment?
    var previousDayEquipment: Equipment?
    
    deinit {
        print("deinit \(NSStringFromClass(type(of: self)))")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        dateLabel.text = "\(personnel?.date ?? "") (\(personnel?.day ?? 0) day of war)"
        personnelLabel.text = "personnel: " +
            ((personnel?.personnelPrefix ?? "") == "about" ? "~" : "") +
            "\(personnel?.personnel ?? 0)" +
            (personnel?.personnelPrefix == "more" ? "+" : "")
        powLabel.text = "prisoner of war: \(personnel?.pow ?? 0)"
    }
}

extension StatsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return equipment?.array.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EquipmentCell", for: indexPath) as! EquipmentCollectionViewCell

        let selectedEquipment = equipment?.array[indexPath.row]
        cell.configure(with: selectedEquipment, previous: previousDayEquipment)
        
        return cell
    }
}
