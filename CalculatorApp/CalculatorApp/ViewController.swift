//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Shouting Lyu on 1/29/19.
//  Copyright © 2019 Shouting Lyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var firstOperand : Double?
    var secondOperand: Double?
    var operatorValue: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func Calculate(a: Double, b: Double, functionName: (Double, Double) -> Double) -> Double {
        return functionName(a, b)
    }
    
    func getResult() {
        var result: Double?
        switch operatorValue {
            case "+/-":
                result = firstOperand! * -1
            case "/":
                if(secondOperand != 0.0) {
                    result = Calculate(a: firstOperand!, b: secondOperand!) {$0 / $1}
                } else {
                    result = 0.0
                    
                }
            case "%":
            result = Calculate(a: firstOperand!, b: secondOperand!) {Double(Int($0) % Int($1))}
            case "X":
                result = Calculate(a: firstOperand!, b: secondOperand!) {$0 * $1}
            case "+":
                result = Calculate(a: firstOperand!, b: secondOperand!) {$0 + $1}
            case "-":
                result = Calculate(a: firstOperand!, b: secondOperand!) {$0 - $1}
            default:
                print("")
            resultLabel.text = String(result!)
            secondOperand = nil
            operatorValue = nil
        }
    }
    
    @IBAction func buttonpressed(_ sender: UIButton) {
        let text = sender.titleLabel?.text
        
        if let buttonText = text {
            switch buttonText{
            case "AC":
                firstOperand = 0.0
                secondOperand = nil
                resultLabel.text = "0.0"
            case "+/-":
                firstOperand = Double(resultLabel.text!)
                secondOperand = nil
                resultLabel.text = "+/-"
                getResult()
            case "+":
                firstOperand = Double(resultLabel.text!)
                operatorValue = "+"
                getResult()
            case "-":
                firstOperand = Double(resultLabel.text!)
                operatorValue = "-"
                getResult()
            case "/":
                firstOperand = Double(resultLabel.text!)
                operatorValue = "/"
                getResult()
            case "%":
                firstOperand = Double(resultLabel.text!)
                operatorValue = "%"
                getResult()
            case "X":
                firstOperand = Double(resultLabel.text!)
                operatorValue = "X"
                getResult()
            case ".":
                if let lblText = resultLabel.text {
                    if(lblText.contains(".")) {
                        resultLabel.text! += buttonText
                    }
                }
            case "=":
                secondOperand = Double(buttonText)
                getResult()
            default:
                if(operatorValue != nil) {
                    resultLabel.text = buttonText
                } else {
                    if(resultLabel.text == "0.0") {
                        resultLabel.text = buttonText
                    } else{
                        resultLabel.text! += buttonText
                    }
                }
                
            }
        }
    }

}

