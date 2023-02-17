//
//  CalculatorViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

final class CalculatorViewModel {
    
    var updateResult: ((String) -> Void)?
    var updateExpression: ((String) -> Void)?
    
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
    
    func touchOnCalculatorButton(at index: Int) {
        let title = keyboardButtonsTitles[index].title
        
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
        guard let data = model.changeSign() else { return }
        updateResult?(data)
    }
    
    private func getPercent() {
        guard let (data, expression) = model.getPercent() else { return }
        updateResult?(data)
        updateExpression?(expression)
    }
    
    private func getResult() {
        guard !isDivisionError() else { return }
        guard let (data, expression) = model.getResult() else { return }
        
        updateResult?(data)
        updateExpression?(expression)
    }
    
    private func updateOperation(_ title: String) {
        guard !isDivisionError() else { return }
        guard let (data, expression) = model.setOperation(currentOperation: title) else { return }
        
        updateResult?(data)
        updateExpression?(expression)
    }
    
    private func addDigit(_ title: String) {
        guard let data = model.addNewDigit(digit: title) else { return }
        updateResult?(data)
    }
    
    private func isDivisionError() -> Bool {
        guard model.checkDivisionByZero() else { return false }
        guard let expression = model.getFullExpression() else { return false }
        
//        didDivisionError?(expression)
        return true
    }
}