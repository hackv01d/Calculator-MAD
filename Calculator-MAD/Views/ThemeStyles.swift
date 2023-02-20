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
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var expressionTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleExpressionTitle
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var primaryCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButton
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var secondaryCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleSecondaryCommandButton
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var primaryOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleOperationButton
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var secondaryOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleSecondaryOperationButton
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var titleCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButtonTitle
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var titleOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleOperationButtonTitle
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var selectedCommandButton: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButton
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var selectedOperationButton: UIColor? {
        switch self {
        case .purple:
            return .purpleSelectedOperationButton
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var selectedCommandButtonTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleCommandButtonTitle
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var selectedOperationButtonTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleSelectedOperationTitle
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
    
    var errorTitle: UIColor? {
        switch self {
        case .purple:
            return .purpleErrorTitle
        case .green:
            return nil
        case .blue:
            return nil
        case .orange:
            return nil
        }
    }
}
