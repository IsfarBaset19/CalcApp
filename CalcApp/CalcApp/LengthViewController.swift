//
//  ViewController.swift
//  CalcApp
//
//  Created by Isfar Baset on 1/30/20.
//  Copyright © 2020 Isfar Baset. All rights reserved.
//
import UIKit

class LengthViewController: UIViewController {

    @IBOutlet weak var yardField: UITextField!
    
    @IBOutlet weak var meterField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
        // make this controller the delegate of the text fields.
               self.yardField.delegate = self
               self.meterField.delegate = self
        
            }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    

    @IBAction func calcBtn(_ sender: UIButton) {
        
        if let meters = Double(meterField.text!){
            if meters > 0 {
                // two decimal places conversion
                yardField.text = String(meters * 1.09361)
            
            }
        }
        
            if let yards = Double(yardField.text!){
            if yards > 0 {
                 // two decimal places cpnversion
                meterField.text = String(yards / 1.09361)
                       
                       }
        }
        }

    @IBAction func clearBtn(_ sender: UIButton) {
        yardField.text = ""
        meterField.text = ""
      
    }
   
    @IBAction func settingsFromLength(_ sender: Any) {
        
         self.performSegue(withIdentifier: "SegueToSettings", sender: self)
    }
    
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
        self.meterField.text = ""
        self.yardField.text = ""
    }
    
    
    @IBAction func modeBtn(_ sender: Any) {
        
       
        titleLabel.text = titleLabel.text == "Length Conversion Calculator" ? "Volume Conversion Calculator" : "Length Converstion Calculator"
        
    
    }
    
}

extension LengthViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
        if textField == self.yardField {
            self.meterField.text = ""
            
        }
        
        else if textField == self.meterField {
            self.yardField.text = ""
        }
    }
    

}

