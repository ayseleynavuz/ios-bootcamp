//
//  ViewController.swift
//  odev5
//
//  Created by Aleyna on 19.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelShowNumber: UILabel!
    
    var equationString = ""
        

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()

    }
    
    func clearAll()
    {
        equationString = ""
    }
    
    @IBAction func buttonAllClear(_ sender: Any) {
        clearAll()
    }
    
    func calculate(equation:String) -> Int {
        let array = equation.split(separator: "+")
        var sum = 0
        print(array)
        for n in array {
            if let value = Int(n) {
                sum += value
             }else {
                 print("Girilen veri hatalı")
             }
            print(sum)
        }
        return sum
    }
    @IBAction func buttonEquals(_ sender: Any) {
        let result = calculate(equation: equationString)
        labelShowNumber.text = String(result)
        equationString = ""
        print("\(equationString) ff")
    }
    
    
    @IBAction func buttonPlus(_ sender: Any) {
        equationString.append("+")
        labelShowNumber.text = equationString
    }
    

    @IBAction func buttonPercent(_ sender: Any) {
    }

    @IBAction func buttonDivide(_ sender: Any) {
    }
    
    @IBAction func buttonDecimal(_ sender: Any) {
    }
    @IBAction func buttonMinus(_ sender: Any) {
       
    }
    @IBAction func buttonTimes(_ sender: Any) {
       
    }

    @IBAction func buttonZero(_ sender: Any) {
        equationString.append("0")
        labelShowNumber.text = equationString
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        //appendDigitToNumber(digit: "1")
        equationString.append("1")
        labelShowNumber.text = equationString
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        equationString.append("2")
        labelShowNumber.text = equationString
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        equationString.append("3")
        labelShowNumber.text = equationString
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        equationString.append("4")
        labelShowNumber.text = equationString
    }

    @IBAction func buttonFive(_ sender: Any) {
        equationString.append("5")
        labelShowNumber.text = equationString
    }
    @IBAction func buttonSix(_ sender: Any) {
        equationString.append("6")
        labelShowNumber.text = equationString
    }
    
    @IBAction func buttonSeven(_ sender: Any) {
        equationString.append("7")
        labelShowNumber.text = equationString
    }
    
    @IBAction func buttonEight(_ sender: Any) {
        equationString.append("8")
        labelShowNumber.text = equationString
    }
    @IBAction func buttonNine(_ sender: Any) {
        equationString.append("9")
        labelShowNumber.text = equationString
    }
    
}

