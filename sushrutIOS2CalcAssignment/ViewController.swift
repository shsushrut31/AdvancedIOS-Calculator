//
//  ViewController.swift
//  sushrutIOS2CalcAssignment
//
//  Created by Student on 2017-01-17.
//  Copyright © 2017 sushrut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num1Text = ""
    var num2Text = ""
    var op = ""
    var isNum1 = true
    var hasOp = false
    var clr = true

    @IBOutlet weak var label: UILabel!
    

    @IBAction func buttonClick(sender: UIButton) {
        if clr {
            label.text = ""
            clr = false
        }
        let currentText = label.text!
        let txtLabel = sender.titleLabel?.text
        if let text = txtLabel {
            switch text {
            case "+", "X", "/", "-":
                if hasOp {
                    return
                }
                op = text
                isNum1 = false
                hasOp = true
                label.text = "\(currentText) \(op) "
                break
            case "=":
                isNum1 = true
                hasOp = false
                clr = true
                let result = calc()
                label.text = "\(result)"
                break
            case "C":
                
                label.text = "0"
                
            default:
                if isNum1 {
                    num1Text = "\(num1Text)\(text)"
                } else {
                    num2Text = "\(num2Text)\(text)"
                }
                label.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
    func calc() -> Double {
        let num1 = Double(num1Text)
        let num2 = Double(num2Text)
        num1Text = ""
        num2Text = ""
        switch op {
        case "+":
            return num1! + num2!
        case "-":
            return num1! - num2!
        case "X":
            return num1! * num2!
        case "/":
            return num1! / num2!
        default:
            return 0
        }
    }

}

