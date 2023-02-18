//
//  UserSettings.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import Foundation

final class UserSettings {
    
    static let shared = UserSettings()
    
    private init() {}
    
    private let standard = UserDefaults.standard
    
    private enum UserSettingsKeys: String {
        case themeStyle
    }
    
    var themeStyle: ThemeStyles {
        get {
            let key = UserSettingsKeys.themeStyle.rawValue
            guard let data = standard.string(forKey: key) else { return .purple }
            guard let themeStyle = ThemeStyles(rawValue: data) else { return .purple }
            return themeStyle
        } set {
            standard.setValue(newValue.rawValue, forKey: UserSettingsKeys.themeStyle.rawValue)
        }
    }
}
