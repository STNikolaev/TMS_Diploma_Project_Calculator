//
//  ViewController.swift
//  TMS_Diploma_Project_Calculator
//
//  Created by Alexandr Nikolaev on 19.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Unable to convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorModel()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let results = calculator.calculate(symbol: calcMethod) {
                displayValue = results
            }
            
            
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numberValue
                isFinishedTypingNumber = false
            } else {
                
                if numberValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if isInt == false {
                        return
                        
                    }
                    
                }
                
                displayLabel.text = displayLabel.text! + numberValue
            }
            
        }
        
    }
    
    
}

