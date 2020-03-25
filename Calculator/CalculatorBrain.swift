//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType? = nil
    var decimalTapped = false
    
    func addOperandDigit(_ digit: String) -> String {
        if digit == "." {
            
            if decimalTapped {
                if operatorType == nil {
                    return operand1String
                } else {
                    return operand2String
                }
            }
            
            decimalTapped = true
            print("decimal tapped")
        }
        
        if operatorType == nil {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if let newOperator = OperatorType(rawValue: operatorString) {
            operatorType = newOperator
            decimalTapped = false
            print("new number wihtout decimal")
        }
    }
    
    func calculateIfPossible() -> String? {
        
        if let op1 = Double(operand1String),
            let op2 = Double(operand2String),
            let calculationOperator = operatorType  {
        
            let answer: Double
            
            switch calculationOperator {
            case .addition:
                answer = op1 + op2
            case .subtraction:
                answer = op1 - op2
            case .multiplication:
                answer = op1 * op2
            case .division:
                if op2 != 0 {
                    answer = op1 / op2
                } else {
                    return "Error"
                }
            }
            
            var displayAnswer: Int? = nil
            
            if Double(Int(answer)) == answer {
                displayAnswer = Int(answer)
            }
            
            if let displayAnswer = displayAnswer {
                operand1String = String(displayAnswer)
            } else {
                operand1String = String(answer)
            }
            
            operand2String = ""
            operatorType = nil
            
            if String(answer).contains(".") {
                decimalTapped = true
                
                print("decimal in answer")
                
            } else {
                decimalTapped = false
                
                print("no decimal in answer")
                
            }
            
            if let displayAnswer = displayAnswer {
                return String(displayAnswer)
            } else {
                return String(answer)
            }
        }
        return nil
    }
}
