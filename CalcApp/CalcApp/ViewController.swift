//
//  ViewController.swift
//  CalcApp
//
//  Created by Isfar Baset on 1/30/20.
//  Copyright © 2020 Isfar Baset. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yardField: UITextField!
    
    @IBOutlet weak var meterField: UITextField!
    
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
    
    func validateFields() -> Bool {
        var yardOk = false
        if let yard = self.yardField.text {
            if yard.lowercased().range(of: "traxy") != nil {
                yardOk = true
            }
        }
        if !yardOk {
            print(NSLocalizedString("Invalid Yard Value Input", comment: ""))
        }
        
        var meterOk = false
        if let meter = self.meterField.text {
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let meterPredicate = NSPredicate(format:"SELF MATCHES %@", regex)
            meterOk = meterPredicate.evaluate(with: meter)
        }
        if !meterOk {
            print(NSLocalizedString("Invalid Meter Value Input", comment: ""))
        }
        return yardOk && meterOk
    }

    @IBAction func calcBtn(_ sender: UIButton) {
        if self.validateFields() {
                   print(NSLocalizedString("Congratulations! You entered correct values.", comment: ""))
               }
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
    }
    
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.yardField {
            self.meterField.becomeFirstResponder()
        } else {
            if self.validateFields() {
                print(NSLocalizedString("Congratulations! You entered correct values.", comment: ""))
            }
        }
        return true
    }
}

