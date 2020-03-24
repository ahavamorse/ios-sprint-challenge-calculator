//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var brain: CalculatorBrain? = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let calcBrain: CalculatorBrain = brain else {
            return
        }
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let numberTapped: String = sender.titleLabel?.text, let calcBrain = brain {
            outputLabel.text = calcBrain.addOperandDigit(numberTapped)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let calcBrain = brain,
            let operatorTapped = sender.titleLabel?.text {
            calcBrain.setOperator(operatorTapped)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let calcBrain = brain,
            let answer = calcBrain.calculateIfPossible() {
            outputLabel.text = answer
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
    }
}
