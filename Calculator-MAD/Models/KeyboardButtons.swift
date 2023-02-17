//
//  KeyboardButtons.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 17.02.2023.
//

import Foundation

enum KeyboardButtons {
    case allClear, plusMinus, percent, decimal, divide, multiply, minus, plus, equal
    case digit(Int)
    
    var isOperation: Bool {
        switch self {
        case .divide, .multiply, .minus, .plus, .equal:
            return true
        default:
            return false
        }
    }
    
    var title: String {
        switch self {
        case .allClear:
            return "AC"
        case .plusMinus:
            return "±"
        case .percent:
            return "%"
        case .decimal:
            return "."
        case .divide:
            return "÷"
        case .multiply:
            return "×"
        case .minus:
            return "-"
        case .plus:
            return "+"
        case .equal:
            return "="
        case .digit(let value):
            return "\(value)"
        }
    }
}
