//
//  CalculatorData.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

final class CalculatorData {
    
    static let shared = CalculatorData()
    
    private init() {}
    
    private let standard = UserDefaults.standard
    
    private enum CalculatorDataKeys: String {
        case result
        case expression
    }
    
    var result: String {
        get {
            let key = CalculatorDataKeys.result.rawValue
            guard let result = standard.string(forKey: key) else { return "17018" }
            return result
        } set {
            standard.set(newValue, forKey: CalculatorDataKeys.result.rawValue)
        }
    }
    
    var expression: String {
        get {
            let key = CalculatorDataKeys.expression.rawValue
            guard let expression = standard.string(forKey: key) else { return "9204 + 7814"}
            return expression
        } set {
            standard.set(newValue, forKey: CalculatorDataKeys.expression.rawValue)
        }
    }
    
    func saveResult(result: String, expression: String) {
        self.result = result
        self.expression = expression
    }
}
