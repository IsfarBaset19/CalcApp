//
//  VolumeViewController.swift
//  CalcApp
//
//  Created by Isfar Baset on 2/4/20.
//  Copyright © 2020 Isfar Baset. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController {

    @IBOutlet weak var litresField: UITextField!
    
    @IBOutlet weak var quartsField: UITextField!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            self.view.addGestureRecognizer(detectTouch)
            
            // make this controller the delegate of the text fields.
                   self.litresField.delegate = self
                   self.quartsField.delegate = self
        }
        
        @objc func dismissKeyboard(){
            self.view.endEditing(true)
        }
        

        @IBAction func calcBtn(_ sender: UIButton) {
            
            if let litres = Double(litresField.text!){
                if litres > 0 {
                    // two decimal places conversion
                    quartsField.text = String(litres * 1.05669)
                
                }
            }
            
                if let quarts = Double(quartsField.text!){
                if quarts > 0 {
                     // two decimal places cpnversion
                    litresField.text = String(quarts / 1.05669)
                           
                           }
            }
    }
        
        
        @IBAction func clearBtn(_ sender: UIButton) {
            litresField.text = ""
            quartsField.text = ""
          
        }
        
        
        @IBAction func ToLength(_ sender: UIButton) {
            
            
        }
    
    
    @IBAction func settingFromVol(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SegueToSettingsFromVolume", sender: self)
    }
    
    
    }

    extension VolumeViewController : UITextFieldDelegate {
        func textFieldDidBeginEditing(_ textField: UITextField) {
        
            if textField == self.litresField {
                self.litresField.text = ""
                
            }
            
            else if quartsField == self.quartsField {
                self.quartsField.text = ""
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
