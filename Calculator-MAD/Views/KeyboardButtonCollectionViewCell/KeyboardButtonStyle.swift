//
//  KeyboardButtonStyle.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation
import UIKit

enum KeyboardButtonStyle {
    case command(ThemeStyles)
    case operation(ThemeStyles)
    
    var primaryBackgroundColor: UIColor? {
        switch self {
        case .command(let theme):
            return theme.primaryCommandButton
        case .operation(let theme):
            return theme.primaryOperationButton
        }
    }
    
    var secondaryBackgroundColor: UIColor? {
        switch self {
        case .command(let theme):
            return theme.secondaryCommandButton
        case .operation(let theme):
            return theme.secondaryOperationButton
        }
    }
    
    var titleColor: UIColor? {
        switch self {
        case .command(let theme):
            return theme.titleCommandButton
        case .operation(let theme):
            return theme.titleOperationButton
        }
    }
    
    var selectedBackgroundColor: UIColor? {
        switch self {
        case .command(let theme):
            return theme.selectedCommandButton
        case .operation(let theme):
            return theme.selectedOperationButton
        }
    }
    
    var selectedTitleColor: UIColor? {
        switch self {
        case .command(let theme):
            return theme.selectedCommandButtonTitle
        case .operation(let theme):
            return theme.selectedOperationButtonTitle
        }
    }
}
