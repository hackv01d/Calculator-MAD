//
//  CalculatorScreenViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

final class CalculatorScreenViewModel {
    
    
    let cellViewModels: [KeyboardButtonViewCellViewModel]
    
    private(set) var header = "Calculator"
    private let keyboardButtons = [
        "AC", "±", "%", "÷",
        "7", "8", "9", "×",
        "4", "5", "6", "-",
        "1", "2", "3", "+",
        "0", ".", "="
    ]
    
    private let model: Calculator

    init(with model: Calculator) {
        self.model = model
        cellViewModels = keyboardButtons.map { KeyboardButtonViewCellViewModel(title: $0) }
    }
    
    func getInitialResult() -> String {
        return model.currentNumber
    }
    
    func getInitialExpression() -> String {
        return model.fullExpression
    }
}
