//
//  KeyboardButtons.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

enum KeyboardButtons {
    case allClear, plusMinus, percent, decimal, divide, multiply, minus, plus, equal
    case digit(Int)
    
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
