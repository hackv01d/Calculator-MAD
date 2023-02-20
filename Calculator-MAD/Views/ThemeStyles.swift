//
//  ThemeStyles.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import Foundation
import UIKit

enum ThemeStyles: String, CaseIterable {
    case purple, green, blue, orange
    
    var resultTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleResultTitle
        case .green:
            return .greenResultTitle
        case .blue:
            return .blueResultTitle
        case .orange:
            return .orangeResultTitle
        }
    }
    
    var expressionTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleExpressionTitle
        case .green:
            return .greenExpressionTitle
        case .blue:
            return .blueExpressionTitle
        case .orange:
            return .orangeExpressionTitle
        }
    }
    
    var primaryCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButton
        case .green:
            return .greenCommandButton
        case .blue:
            return .blueCommandButton
        case .orange:
            return .orangeCommandButton
        }
    }
    
    var secondaryCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleSecondaryCommandButton
        case .green:
            return .greenSecondaryCommandButton
        case .blue:
            return .blueSecondaryCommandButton
        case .orange:
            return .orangeSecondaryCommandButton
        }
    }
    
    var primaryOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleOperationButton
        case .green:
            return .greenOperationButton
        case .blue:
            return .blueOperationButton
        case .orange:
            return .orangeOperationButton
        }
    }
    
    var secondaryOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleSecondaryOperationButton
        case .green:
            return .greenSecondaryOperationButton
        case .blue:
            return .blueSecondaryOperationButton
        case .orange:
            return .orangeSecondaryOperationButton
        }
    }
    
    var titleCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButtonTitle
        case .green:
            return .greenCommandButtonTitle
        case .blue:
            return .blueCommandButtonTitle
        case .orange:
            return .orangeCommandButtonTitle
        }
    }
    
    var titleOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleOperationButtonTitle
        case .green:
            return .greenOperationButtonTitle
        case .blue:
            return .blueOperationButtonTitle
        case .orange:
            return .orangeOperationButtonTitle
        }
    }
    
    var selectedCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButton
        case .green:
            return .greenCommandButton
        case .blue:
            return .blueCommandButton
        case .orange:
            return .orangeCommandButton
        }
    }
    
    var selectedOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleSelectedOperationButton
        case .green:
            return .greenSelectedOperationButton
        case .blue:
            return .blueSelectedOperationButton
        case .orange:
            return .orangeSelectedOperationButton
        }
    }
    
    var selectedCommandButtonTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButtonTitle
        case .green:
            return .greenCommandButtonTitle
        case .blue:
            return .blueCommandButtonTitle
        case .orange:
            return .orangeCommandButtonTitle
        }
    }
    
    var selectedOperationButtonTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleSelectedOperationTitle
        case .green:
            return .greenSelectedOperationTitle
        case .blue:
            return .blueSelectedOperationTitle
        case .orange:
            return .orangeSelectedOperationTitle
        }
    }
    
    var errorTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleErrorTitle
        case .green:
            return .greenErrorTitle
        case .blue:
            return .blueErrorTitle
        case .orange:
            return .orangeErrorTitle
        }
    }
}
