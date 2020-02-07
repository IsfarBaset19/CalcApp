//
//  ViewController.swift
//  CalcApp
//
//  Created by Isfar Baset on 1/30/20.
//  Copyright © 2020 Isfar Baset. All rights reserved.
//
import UIKit

class MainViewController: UIViewController, SettingsViewControllerDelegate {
    
    
    @IBOutlet weak var fromVal: DecimalMinusTextField!
    @IBOutlet weak var toVal: DecimalMinusTextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var toUnit: UILabel!
    @IBOutlet weak var fromUnit: UILabel!
    
    var lengthUnit:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
        // make this controller the delegate of the text fields.
               self.fromVal.delegate = self
               self.toVal.delegate = self
        
            }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    

    @IBAction func calcBtn(_ sender: UIButton) {
        
        let label1: UILabel = fromUnit
        let label2: UILabel = toUnit
        let field1: DecimalMinusTextField! = fromVal
        let field2: DecimalMinusTextField! = toVal
        
        if lengthUnit{
            
            // Meters - Yards
            if label1.text == "Meters"{
                if label2.text == "Yards"{
                    
                    if let meters = Double(field1.text!){
                    field2.text = String(meters * 1.09361)
                    }
                    else{
                        if let meters = Double(field2.text!){
                        field1.text = String(meters / 1.09361)
                        }
                    }
                }
            }
            
            //Yards - Meters
            if label1.text == "Yards"{
                if label2.text == "Meters"{
                    
                    if let yards = Double(field1.text!){
                    field2.text = String(yards / 1.09361)
                    }
                    else{
                        if let yards = Double(field2.text!){
                        field1.text = String(yards * 1.09361)
                        }
                    }
                }
            }
            
            //Meters - Miles
            if label1.text == "Meters"{
                if label2.text == "Miles"{
                    
                    if let meters = Double(field1.text!){
                    field2.text = String(meters * 0.000621371)
                    }
                    else{
                        if let meters = Double(field2.text!){
                        field1.text = String(meters / 0.000621371)
                        }
                    }
                }
            }
            
            
            // Miles - Meter
            if label1.text == "Miles"{
                if label2.text == "Meters"{
                    
                    if let miles = Double(field1.text!){
                    field2.text = String(miles / 0.000621371)
                    }
                    else{
                        if let miles = Double(field2.text!){
                        field1.text = String(miles * 0.000621371)
                        }
                    }
                }
            }
            
            // Yards to Miles
            
            if label1.text == "Yards"{
                if label2.text == "Miles"{
                    
                    if let yards = Double(field1.text!){
                    field2.text = String(yards * 0.000568182)
                    }
                    else{
                        if let miles = Double(field2.text!){
                        field1.text = String(miles / 0.000568182)
                        }
                    }
                }
            }
            
            // Miles to Yards
            if label1.text == "Miles"{
                if label2.text == "Yards"{
                    
                    if let miles = Double(field1.text!){
                    field2.text = String(miles * 1760)
                    }
                    else{
                        if let yards = Double(field2.text!){
                        field1.text = String(yards / 1760)
                        }
                    }
                }
            }
            
            // Miles to Miles
            if label1.text == "Miles"{
                if label2.text == "Miles"{
                    
                    if let miles = Double(field1.text!){
                    field2.text = String(miles)
                    }
                    else{
                        if let miles = Double(field2.text!){
                        field1.text = String(miles)
                        }
                    }
                }
            }
            
            
            // Meters to meters
            if label1.text == "Meters"{
                if label2.text == "Meters"{
                    
                    if let meters = Double(field1.text!){
                    field2.text = String(meters)
                    }
                    else{
                        if let meters = Double(field2.text!){
                        field1.text = String(meters)
                        }
                    }
                }
            }
            
            // Yards to Yards
            if label1.text == "Yards"{
                if label2.text == "Yards"{
                    
                    if let yards = Double(field1.text!){
                    field2.text = String(yards)
                    }
                    else{
                        if let yards = Double(field2.text!){
                        field1.text = String(yards)
                        }
                    }
                }
            }
   
        }
        
        else{
            
            // Liters to Gallons
            if label1.text == "Litres"{
                if label2.text == "Gallons"{
                    
                    if let liters = Double(field1.text!){
                    field2.text = String(liters * 0.264172)
                    }
                    else{
                        if let gallons = Double(field2.text!){
                            field1.text = String(gallons / 0.264172)
                        }
                    }
                }
            }
            
            // Gallons to Liters
            
            if label1.text == "Gallons"{
                        if label2.text == "Litres"{
                            
                            if let gallons = Double(field1.text!){
                            field2.text = String(gallons * 3.78541)
                            }
                            else{
                                if let liters = Double(field2.text!){
                                    field1.text = String(liters / 3.78541)
                                }
                            }
                        }
                    }
            
            // Liters to Quarts
            if label1.text == "Litres"{
                if label2.text == "Quarts"{
                    
                    if let liters = Double(field1.text!){
                    field2.text = String(liters * 1.05669)
                    }
                    else{
                        if let quarts = Double(field2.text!){
                            field1.text = String(quarts / 1.05669)
                        }
                    }
                }
            }
            
            
            // Quarts to Liters
            if label1.text == "Quarts"{
                        if label2.text == "Litres"{
                            
                            if let quarts = Double(field1.text!){
                            field2.text = String(quarts * 0.946353)
                            }
                            else{
                                if let liters = Double(field2.text!){
                                    field1.text = String(liters / 0.946353)
                                }
                            }
                        }
                    }
            
            // Gallons to Quarts
            if label1.text == "Gallons"{
            if label2.text == "Quarts"{
                                     
            if let gallons = Double(field1.text!){
            field2.text = String(gallons * 4)
            }
            else{
            if let quarts = Double(field2.text!){
            field1.text = String(quarts / 4)
            }
        }
    }
}
            
            // Quarts to Gallons
            if label1.text == "Quarts"{
                if label2.text == "Gallons"{
                                     
                    if let quarts = Double(field1.text!){
                    field2.text = String(quarts * 0.25)
                    }
                    else{
                    if let gallons = Double(field2.text!){
                    field1.text = String(gallons / 0.25)
                }
            }
        }
    }
            
            // Gallons to gallons
            if label1.text == "Gallons"{
                        if label2.text == "Gallons"{
                                                
                        if let gallons = Double(field1.text!){
                        field2.text = String(gallons)
                      }
                     else{
                      if let gallons = Double(field2.text!){
                     field1.text = String(gallons)
                  }
                  }
             }
           }
            
            // Liters to Liters
            if label1.text == "Litres"{
            if label2.text == "Litres"{
                                                
            if let liters = Double(field1.text!){
            field2.text = String(liters)
            }
            else{
            if let liters = Double(field2.text!){
            field1.text = String(liters)
            }
        }
        }
    }
            
            // Quarts to quarts
            if label1.text == "Quarts"{
              if label2.text == "Quarts"{
                                                
                if let quarts = Double(field1.text!){
                field2.text = String(quarts)
                }
                else{
                if let quarts = Double(field2.text!){
                field1.text = String(quarts)
                }
            }
        }
        }
       
        }
    }

    @IBAction func clearBtn(_ sender: UIButton) {
        fromVal.text = ""
        toVal.text = ""
      
    }
    
    @IBAction func settingsFromLength(_ sender: Any) {
        
         self.performSegue(withIdentifier: "SegueToSettings", sender: self)
    }
 
    @IBAction func modeBtn(_ sender: Any) {
        
        if lengthUnit == true {
            fromUnit.text = "Gallons"
            toUnit.text = "Litres"
            titleLabel.text = "Volume Conversion Calculator"
            fromVal.placeholder = "Enter Volume"
            toVal.placeholder = "Enter Volume"
           
            lengthUnit = false
        } else {
            
            toUnit.text = "Yards"
            fromUnit.text = "Meters"
            titleLabel.text = "Length Conversion Calculator"
            
            lengthUnit = true
            
            fromVal.placeholder = "Enter Length"
            toVal.placeholder = "Enter Length"
            
        }
        
        
    }
    
    
    func settingsChanged(fromUnits: String, toUnits: String) {
          fromUnit.text = fromUnits
          toUnit.text = toUnits
      }
      
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let dest = segue.destination.children[0] as? SettingsViewController{
              dest.delegate = self
              dest.isLength = self.lengthUnit
           }
   }

}

extension MainViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
        if textField == self.fromVal {
            self.toVal.text = ""
            
        }
        
        else if textField == self.toVal {
            self.fromVal.text = ""
        }
    }
    

}


