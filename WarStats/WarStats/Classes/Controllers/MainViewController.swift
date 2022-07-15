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
        
        if let fileURL = Bundle.main.url(forResource: "russia_losses_personnel", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                
                do {
                    personnelArray = try JSONDecoder().decode([Personnel].self, from: jsonData)
                    print(personnelArray.count)
                } catch {
                    print(error)
                }
            }
        }
        
        datePicker.minimumDate = personnelArray.first?.date?.toDate()
        datePicker.maximumDate = personnelArray.last?.date?.toDate()
        datePicker.date = personnelArray.first?.date?.toDate() ?? Date()
        
        if let fileURL = Bundle.main.url(forResource: "russia_losses_equipment", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                
                var jsonString = String(data: jsonData, encoding: .utf8)
                jsonString = jsonString?.replacingOccurrences(of: "NaN", with: "0")

                let array = jsonString?.toJSON() as? [Dictionary<String, AnyObject>]
                for dict in array ?? [] {
                    let equipment = Equipment(with: dict)
                    equipmentArray.append(equipment)
                }
            }
        }
        
        
        
        
        
//        let urlString = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/918debb3b328b74173d50cc9824507ed59e9c3c2/data/russia_losses_equipment.json"
//
//        if let url = URL(string: urlString) {
//            if let jsonData = try? Data(contentsOf: url) {
//                let personnelArray: [Personnel] = try! JSONDecoder().decode([Personnel].self, from: jsonData)
//                print(personnelArray.count)
//            }
//        }
    }
    
    @IBAction func showAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StatsViewController") as! StatsViewController
        vc.personnel = personnelArray[dayPickerView.selectedRow(inComponent: 0)]
        vc.equipment = equipmentArray[dayPickerView.selectedRow(inComponent: 0)]
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
