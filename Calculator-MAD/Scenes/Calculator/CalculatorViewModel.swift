//
//  CalculatorViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation
import UIKit

final class CalculatorViewModel {
    
    var updateResult: ((String) -> Void)?
    var updateExpression: ((String) -> Void)?
    var showCalculateError: ((String) -> Void)?
    
    let cellViewModels: [KeyboardButtonViewCellViewModel]
    
    private(set) var header = "Calculator"
    private let keyboardButtonsTitles: [KeyboardButtons] = [
        .allClear, .plusMinus, .percent, .divide,
        .digit(7), .digit(8), .digit(9), .multiply,
        .digit(4), .digit(5), .digit(6), .minus,
        .digit(1), .digit(2), .digit(3), .plus,
        .digit(0), .decimal, .equal
    ]
    
    private let model: Calculator

    init(with model: Calculator) {
        self.model = model
        cellViewModels = keyboardButtonsTitles.map { KeyboardButtonViewCellViewModel(title: $0.title, isOperation: $0.isOperation) }
    }
    
    func getInitialResult() -> String {
        return model.currentNumber
    }
    
    func getInitialExpression() -> String {
        return model.fullExpression
    }
    
    func removeDigit() {
        guard let value = model.deleteLastDigit() else { return }
        updateResult?(value.replaceDecimal)
    }
    
    func touchOnCalculatorButton(at index: Int) {
        let title = keyboardButtonsTitles[index].title.replacingOccurrences(of: ",", with: ".")
        
        switch title {
        case "AC":
            reset()
        case "±":
            addPlusMinus()
        case "%":
            getPercent()
        case "=":
            getResult()
        case "÷", "×", "-", "+":
            updateOperation(title)
        default:
            addDigit(title)
        }
    }
    
    private func reset() {
        model.resetData()
        updateResult?("0")
        updateExpression?("")
    }
    
    private func addPlusMinus() {
        guard let value = model.changeSign() else { return }
        updateResult?(value.replaceDecimal)
    }
    
    private func getPercent() {
        guard let (value, expression) = model.getPercent() else { return }
        
        updateResult?(value.replaceDecimal)
        updateExpression?(expression.replaceDecimal)
    }
    
    private func getResult() {
        guard !isDivisionError() else { return }
        guard let (value, expression) = model.getResult() else { return }
        
        updateResult?(value.replaceDecimal)
        updateExpression?(expression.replaceDecimal)
    }
    
    private func updateOperation(_ title: String) {
        guard !isDivisionError() else { return }
        guard let (value, expression) = model.setOperation(currentOperation: title) else { return }
        
        updateResult?(value.replaceDecimal)
        updateExpression?(expression.replaceDecimal)
    }
    
    private func addDigit(_ title: String) {
        guard let value = model.addNewDigit(digit: title) else { return }
        updateResult?(value.replaceDecimal)
    }
    
    private func isDivisionError() -> Bool {
        guard model.checkDivisionByZero() else { return false }
        
        showCalculateError?("Error")
        return true
    }
}

