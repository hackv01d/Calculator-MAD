//
//  SettingsTableViewSection.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 19.02.2023.
//

import Foundation

enum SettingsSection: Int, CaseIterable {
    case keyboard, theme
    
    var title: String {
        switch self {
        case .keyboard:
            return "Keyboard"
        case .theme:
            return "Theme"
        }
    }
    
    var items: [String] {
        switch self {
        case .keyboard:
            return ["Sound", "Haptic"]
        case .theme:
            return ["Purple", "Green", "Blue", "Orange"]
        }
    }
}
