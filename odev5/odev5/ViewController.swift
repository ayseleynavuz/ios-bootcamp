//
//  ViewController.swift
//  odev5
//
//  Created by Aleyna on 19.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelShowNumber: UILabel!
    
    
    var firstNumber: Double = 0
    var currentOperation: String = ""
    var isTypingNumber = false
    
    var result = 0.0   // if double
    var resultInt = 0  // if int
    var resultIntToDouble = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()

    }
    
    func clearAll()
    {
        labelShowNumber.text = "0"
        firstNumber = 0
        currentOperation = ""
        isTypingNumber = false
    }
    
    @IBAction func buttonAllClear(_ sender: Any) {
        clearAll()
    }
    
    // handle operation
    func handleOperation(_ operation: String) {
        if isTypingNumber {
            firstNumber = Double(labelShowNumber.text!)!
            isTypingNumber = false
        }
        currentOperation = operation
    }
    
    // performOperation
    func performOperation(firstNumber: Double, secondNumber: Double, operation: String) -> Double {
        switch operation {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }

    func appendDigitToNumber(digit: String) {
        if isTypingNumber {
            labelShowNumber.text! += digit
        } else {
            labelShowNumber.text! = digit
            isTypingNumber = true
        }
    }
    
    
    
    @IBAction func buttonEquals(_ sender: Any) {
          if isTypingNumber {
              let secondNumber = Double(labelShowNumber.text!)!
              let result = performOperation(firstNumber: firstNumber, secondNumber: secondNumber, operation: currentOperation)
              
              let resultInt = Int(result)
              let resultIntToDouble = Double(resultInt)
              
              if result == resultIntToDouble {
                  labelShowNumber.text = String(resultInt)
              } else {
                  labelShowNumber.text = String(result)
              }
              
              firstNumber = result
              isTypingNumber = false
          }
      }

    
    // + plus operation
    @IBAction func buttonPlus(_ sender: Any) {
        handleOperation("+")
    }
    // percent tap - %
    @IBAction func buttonPercent(_ sender: Any) {
        
    }

    @IBAction func buttonDivide(_ sender: Any) {
        handleOperation("/")
    }
    
    @IBAction func buttonDecimal(_ sender: Any) {
        if !labelShowNumber.text!.contains(",") {
            labelShowNumber.text! += ","
            isTypingNumber = true
        }
    }
    @IBAction func buttonMinus(_ sender: Any) {
        handleOperation("-")
    }
    @IBAction func buttonTimes(_ sender: Any) {
        handleOperation("*")
    }


    @IBAction func buttonZero(_ sender: Any) {
        appendDigitToNumber(digit: "0")
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        appendDigitToNumber(digit: "1")
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        appendDigitToNumber(digit: "2")
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        appendDigitToNumber(digit: "3")
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        appendDigitToNumber(digit: "4")
    }

    @IBAction func buttonFive(_ sender: Any) {
        appendDigitToNumber(digit: "5")
    }
    @IBAction func buttonSix(_ sender: Any) {
        appendDigitToNumber(digit: "6")
    }
    
    @IBAction func buttonSeven(_ sender: Any) {
        appendDigitToNumber(digit: "7")
    }
    
    @IBAction func buttonEight(_ sender: Any) {
        appendDigitToNumber(digit: "8")
    }
    @IBAction func buttonNine(_ sender: Any) {
        appendDigitToNumber(digit: "9")
    }
    
    
    
    
}

