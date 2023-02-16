//
//  CalculatorScreenViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

final class CalculatorScreenViewModel {
    
    private(set) var header = "Calculator"
    
    private let model: Calculator
    
    init(with model: Calculator) {
        self.model = model
    }
    
    func getInitialResult() -> String {
        return model.currentNumber
    }
    
    func getInitialExpression() -> String {
        return model.fullExpression
    }
}
