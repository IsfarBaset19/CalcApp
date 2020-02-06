//
//  SettingsViewController.swift
//  CalcApp
//
//  Created by Isfar Baset on 2/4/20.
//  Copyright © 2020 Isfar Baset. All rights reserved.
//

import UIKit

  
  protocol SettingsViewControllerDelegate {
 
 // func settingsChanged(fromUnits: LengthUnit , toUnits: LengthUnit )
  //func settingsChanged(fromUnits: VolumeUnit , toUnits: VolumeUnit )
  }

class SettingsViewController: UIViewController {
    

    var pickerData: [String] = [String]()

    @IBOutlet weak var from: UITextField!
    @IBOutlet weak var to: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.picker.isHidden = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        
       
        self.pickerData = ["-", "Meters", "Yards", "Miles", "Litres", "Quarts", "Gallons"]
        
        
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
        
            return pickerData.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
      
            return self.pickerData[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if from.isFirstResponder{
            
    
        from.text = "From Units:  \(self.pickerData[row])"
        }
        else{
           
            to.text = "To Units:  \(self.pickerData[row])"
            
        }

    }
  
    
}
