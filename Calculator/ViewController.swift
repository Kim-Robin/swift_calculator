//
//  ViewController.swift
//  Calculator
//
//  Created by Robin Kim on 9/22/20.
//  Copyright © 2020 Robin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //number1 number2 operator result
    
    var displayText: String = ""
    var firstNum: String = ""
    var operatorSign: String = ""
    var secondNum: String = ""
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for b in buttons{
            b.layer.cornerRadius = b.frame.size.height / 2
        }
    }
    
    
    @IBAction func Buttons(_ sender: UIButton) {
        if (sender.currentTitle ?? "0" == "C"){
            firstNum = "0"
            secondNum = "0"
            display.text = "0"
        } else if( (sender.currentTitle ?? "0") == "+"){
            secondNum = firstNum
            firstNum = "0"
            operatorSign = "+"
        } else if((sender.currentTitle ?? "0") == "−"){
            secondNum = firstNum
            firstNum = "0"
            operatorSign = "-"
        } else if((sender.currentTitle ?? "0") == "×"){
            secondNum = firstNum
            firstNum = "0"
            operatorSign = "*"
        }else if((sender.currentTitle ?? "0") == "÷"){
            secondNum = firstNum
            firstNum = "0"
            operatorSign = "/"
        }else if((sender.currentTitle ?? "0") == "%"){
            secondNum = firstNum
            firstNum = "0"
            operatorSign = "%"
        }else if((sender.currentTitle ?? "0") == "="){
            if (operatorSign == "+"){
                display.text = String(Double(secondNum)! + Double(firstNum)!)
            }else if(operatorSign == "*"){
                display.text = String(Double(secondNum)! * Double(firstNum)!)
            }else if(operatorSign == "-"){
                display.text = String(Double(secondNum)! - Double(firstNum)!)
            }else if(operatorSign == "/"){
                display.text = String(Double(secondNum)! / Double(firstNum)!)
            }else if(operatorSign == "%"){
                display.text = String(Double(secondNum)!.truncatingRemainder(dividingBy: Double(firstNum)!))
            }else{
                display.text = firstNum
            }
            
            firstNum = display.text!
            secondNum = ""
        }else{
            if(firstNum == "0" && sender.currentTitle ?? "0" == "."){
                firstNum = "0."
            }else if(firstNum == "0" && sender.currentTitle ?? "0" == "00"){
                firstNum = "0"
            }else if(firstNum == "0"){
                firstNum = sender.currentTitle ?? "0"
            }else{
                firstNum += sender.currentTitle ?? "0"
            }
            display.text = firstNum
        }
        
        
        
        
    }
    
    

}

