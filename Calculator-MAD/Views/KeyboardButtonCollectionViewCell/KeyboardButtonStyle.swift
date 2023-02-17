//
//  KeyboardButtonStyle.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation
import UIKit

enum KeyboardButtonStyle {
    case command, operation
    
    var primaryBackgroundColor: UIColor? {
        switch self {
        case .command:
            return .commandButton
        case .operation:
            return .operationButton
        }
    }
    
    var secondaryBackgroundColor: UIColor? {
        switch self {
        case .command:
            return .secondaryCommandButton
        case .operation:
            return .secondaryOperationButton
        }
    }
    
    var titleColor: UIColor? {
        switch self {
        case .command:
            return .commandButtonTitle
        case .operation:
            return .operationButtonTitle
        }
    }
    
    var selectedBackgroundColor: UIColor? {
        switch self {
        case .command:
            return nil
        case .operation:
            return .selectedOperationButton
        }
    }
    
    var selectedTitleColor: UIColor? {
        switch self {
        case .command:
            return nil
        case .operation:
            return .selectedOperationTitle
        }
    }
}
