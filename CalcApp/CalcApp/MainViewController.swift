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
       //1. Meter - yard
       // 2. yard - meter
       //3. meter - miles
        //4. miles-meter
        //5. miles-yard
        //6. yard-miles
        //7. miles-miles
        //8. yard-yard
       // 9. meter-meter
        
        
        if let meters = Double(fromVal.text!){
            if meters > 0 {
                // two decimal places conversion
                toVal.text = String(meters * 1.09361)
            }
        }
        
            if let yards = Double(toVal.text!){
            if yards > 0 {
                 // two decimal places cpnversion
                fromVal.text = String(yards / 1.09361)
                       
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
            toUnit.text = "Liters"
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


