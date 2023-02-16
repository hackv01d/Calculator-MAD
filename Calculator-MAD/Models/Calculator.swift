//
//  Calculator.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

final class Calculator {
    
    // MARK: - Private properties
    
    private var firstNumber: Double?
    private var secondNumber: Double?
    private var operation: String?
    
    private(set) var currentNumber: String
    private(set) var fullExpression: String
    
    init() {
        currentNumber = CalculatorData.shared.result
        fullExpression = CalculatorData.shared.expression
    }
    
    private var isTransition = false
    private var isDivisionByZero: Bool {
        guard firstNumber != nil else { return false }
        if (currentNumber == "0" && operation == "÷") { return true }
        return false
    }
    private var isFirstNumber: Bool {
        guard firstNumber != nil else { return false }
        return true
    }
    
    private var result: Double? {
        secondNumber = currentNumber.toDouble
        guard let firstNumber = firstNumber else { return nil }
        guard let secondNumber = secondNumber else { return nil }
        guard let operation = operation else { return nil }

        let result: Double?
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "×":
            result = firstNumber * secondNumber
        case "÷":
            guard secondNumber.rightType != "0" else { return nil }
            result = firstNumber / secondNumber
        default:
            return nil
        }

        resetData()
        guard let result = result else { return nil }
        
        currentNumber = result.rightType
        fullExpression = "\(firstNumber.rightType) \(operation) \(secondNumber.rightType) ="
        
        CalculatorData.shared.saveResult(result: result.rightType, expression: fullExpression)
        
        return result
    }
    
    private var percent: (String, String)? {
        if (firstNumber == nil || ["÷", "×"].contains(operation)) {
            let number = currentNumber.toDouble
            guard var number = number else { return nil }
            
            number /= 100
            currentNumber = String(number)
            fullExpression = "\((number * 100).rightType)%"
            
            CalculatorData.shared.saveResult(result: number.rightType, expression: fullExpression)
            
            return (number.rightType, fullExpression)
        }
        
        let number = currentNumber.toDouble
        guard var number = number else { return nil }
        guard let firstNumber = firstNumber else { return nil }
        
        number = firstNumber / 100 * number
        currentNumber = String(number)
        return (number.rightType, "")
    }
    
    // MARK: - Public methods
    
    func addNewDigit(digit: String) -> String? {
        if (currentNumber.contains(".") && digit == "." || currentNumber.count >= 15) {
            return nil
        }
        
        if (digit != "." && currentNumber == "0") {
            currentNumber.removeAll()
        }
        if (currentNumber == "-0" && digit != ".") {
            currentNumber = "-" + digit
        } else if (isFirstNumber && !isTransition) {
            guard digit != "." else { return nil }
            currentNumber = digit
            isTransition = true
        } else {
            currentNumber += digit
        }
        return currentNumber
    }
    
    func setOperation(currentOperation: String) -> (String, String)? {
        guard currentNumber.last != "." else { return nil }
        guard firstNumber != nil else {
            self.firstNumber = currentNumber.toDouble
            self.operation = currentOperation
            currentNumber = ""
            return nil
        }
        
        if (!currentNumber.isEmpty) {
            let resultNumber = self.result
            guard let result = resultNumber else { return nil }

            self.operation = currentOperation
            self.firstNumber = result
            currentNumber = ""
            return (result.rightType, fullExpression)
        } else {
            self.operation = currentOperation
            return nil
        }
    }
    
    func changeSign() -> String? {
        guard !currentNumber.isEmpty else { return nil }
        
        if (currentNumber.first != "-") {
            currentNumber.insert("-", at: currentNumber.startIndex)
        } else {
            currentNumber.remove(at: currentNumber.startIndex)
        }
        return currentNumber
    }
    
    func resetData() {
        self.firstNumber = nil
        self.secondNumber = nil
        self.operation = nil
        self.isTransition = false
        self.currentNumber = "0"
        fullExpression = ""
        CalculatorData.shared.saveResult(result: currentNumber, expression: fullExpression)
    }
    
    func getFullExpression() -> String? {
        guard let firstNumber = firstNumber else { return nil }
        guard let operation = operation else { return nil }
        guard let secondNumber = currentNumber.toDouble else { return nil }
        return "\(firstNumber.rightType) \(operation) \(secondNumber.rightType)"
    }
    
    func getPercent() -> (String, String)? {
        guard let (percent, fullExpression) = percent else { return nil }
        return (percent, fullExpression)
    }
    
    func getResult() -> (String, String)? {
        guard let result = result else { return nil }
        return (result.rightType, fullExpression)
    }
    
    func checkDivisionByZero() -> Bool {
        return isDivisionByZero
    }
}
