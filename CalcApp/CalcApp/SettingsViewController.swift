//
//  SettingsViewController.swift
//  CalcApp
//
//  Created by Isfar Baset on 2/4/20.
//  Copyright © 2020 Isfar Baset. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var lengthPickerData: [String] = [String]()
      var volumePickerData: [String] = [String]()
    var selection : String = "From Unit: "
    
    

    @IBOutlet weak var from: UITextField!
    @IBOutlet weak var to: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lengthPickerData = ["-", "Meters", "Yards", "Miles"]
        self.volumePickerData = ["-", "Litres", "Quarts", "Gallons"]
        
        self.picker.dataSource = self
        self.picker.delegate = self
        
        from.inputView = picker
        to.inputView = picker
       
        
    }
    
    //@IBAction func cancelBtn(_ sender: Any) {
      //  self.dismiss(animated: true, completion: nil)
    //}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lengthPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.lengthPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        from.text = "From Units:  \(self.lengthPickerData[row])"
        
        
        
    }
  
    
}
