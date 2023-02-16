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
    
    var textColor: UIColor? {
        switch self {
        case .command:
            return .commandButtonTitle
        case .operation:
            return .operationButtonTitle
        }
    }
}
