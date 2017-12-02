//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Su, Tina on 9/28/17.
//  Copyright © 2017 FOCAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberLabel: UILabel!
    var currentOperation: String? = nil
    var mathString: String = ""
    
    //clears number function
    @IBAction func hitClear(_ sender: UIButton){
        numberLabel.text = "0"
        currentOperation = nil
        mathString = ""
    }
    
    //Change sign function
    @IBAction func hitChangeSign(){
        let number = Double (numberLabel.text ?? "0" ) ?? 0
        numberLabel.text = "\(-number)"
        
    }
    // change to percentage-decimal number
    @IBAction func hitPercentage(){
        let number = Double (numberLabel.text ?? "0" ) ?? 0
        numberLabel.text = "\(number/100)"
        
    }
    // hit number function
    @IBAction func hitNumber(_ sender: UIButton){
        if let number = sender.titleLabel?.text{
            if let original = numberLabel.text, original != "0" && currentOperation == nil{
            numberLabel.text?.append(number)
            }else{
                if let op = currentOperation{
                    mathString.append(numberLabel.text ?? "")
                    
                    if op == "X" {
                        mathString.append("*")
                    } else {
                        mathString.append(op)
                    }
                    currentOperation = nil
                }
    
                numberLabel.text = number
            }
        }
    }
    // hit operations function
    @IBAction func hitOperations(_ sender: UIButton){
        //store the operation hit
        currentOperation = sender.titleLabel?.text
        
    }
    
    //decimal function
    @IBAction func hitDecimal(){
        if let text = numberLabel.text, !text.contains("."){
            
        }
    }
    
    // equals function
    @IBAction func hitEquals(){
        mathString.append(numberLabel.text ?? "")
        let exp = NSExpression(format: mathString)
        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            numberLabel.text = "\(result)"
        }
        mathString = ""
    }
}

