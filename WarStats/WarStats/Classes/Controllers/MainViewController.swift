//
//  MainViewController.swift
//  WarStats
//
//  Created by Alex Sander on 10.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var personnelArray = [Personnel]()
    var equipmentArray = [Equipment]()
    
    deinit {
        print("deinit \(NSStringFromClass(type(of: self)))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personnelArray = DataManager.shared.getPersonnel(from: Constants.fileNames.lossesPersonnel)
        equipmentArray = DataManager.shared.getEquipment(from: Constants.fileNames.lossesEquipment)
        
        setupUI()
    }
    
    private func setupUI() {
        datePicker.minimumDate = personnelArray.first?.date?.toDate()
        datePicker.maximumDate = personnelArray.last?.date?.toDate()
        datePicker.date = personnelArray.first?.date?.toDate() ?? Date()
    }
    
    @IBAction func showAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StatsViewController") as! StatsViewController
        vc.personnel = personnelArray[dayPickerView.selectedRow(inComponent: 0)]
        vc.equipment = equipmentArray[dayPickerView.selectedRow(inComponent: 0)]
        vc.previousDayEquipment = equipmentArray[max(dayPickerView.selectedRow(inComponent: 0) - 1, 0)]
        present(vc, animated: true)
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return personnelArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Day \(personnelArray[row].day ?? 0)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        datePicker.date = personnelArray[row].date?.toDate() ?? Date()
    }
    
    @IBAction func onChangeDate(_ sender: UIDatePicker) {
        let indexOfDay = personnelArray.firstIndex{$0.date == sender.date.toString()} ?? 0
        dayPickerView.selectRow(indexOfDay, inComponent: 0, animated: true)
    }
}
