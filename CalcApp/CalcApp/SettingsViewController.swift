//
//  SettingsViewController.swift
//  CalcApp
//
//  Created by Isfar Baset on 2/4/20.
//  Copyright © 2020 Isfar Baset. All rights reserved.
//
// Tap gesture regonizing for UIPicker help was taken from https://medium.com/app-makers/how-to-add-a-tap-gesture-to-uilabel-in-xcode-swift-7ada58f1664


import UIKit

protocol SettingsViewControllerDelegate {
 func settingsChanged(fromUnits: LengthUnit , toUnits: LengthUnit )
 func settingsChanged(fromUnits: VolumeUnit , toUnits: VolumeUnit )
}

class SettingsViewController: UIViewController {
    

    var pickerData: [String] = [String]()
    
    var selection : String = "-"

    @IBOutlet weak var changed: UILabel!
    
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    var delegate : SettingsViewControllerDelegate?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.isHidden = true
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissPicker))
        self.view.addGestureRecognizer(detectTouch)
        
        self.setupLabelTap()
        self.setupLabelTap1()

        self.pickerData = ["-", "Meters", "Yards", "Miles", "Litres", "Quarts", "Gallons"]
        
        
        self.picker.dataSource = self
        self.picker.delegate = self

   
    }
    

    @objc func dismissPicker(){
        picker.isHidden = true
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        picker.isHidden = false
        changed = from
        print("labelTapped")
        
        
    }

    @objc func labelTapped1(_ sender: UITapGestureRecognizer) {
        picker.isHidden = false
        changed = to
        print("labelTapped1")

    }
    
    func setupLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.from.isUserInteractionEnabled = true
        self.from.addGestureRecognizer(labelTap)
        
    }
    
    func setupLabelTap1() {
        
        let labelTap1 = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped1(_:)))
        self.to.isUserInteractionEnabled = true
        self.to.addGestureRecognizer(labelTap1)
        
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
        
        changed.text = "\(self.pickerData[row])"
   
}
}
