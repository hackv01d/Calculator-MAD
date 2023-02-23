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
        case isSoundKeyboard
        case isHapticKeyboard
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
    
    var isSoundKeyboard: Bool {
        get {
            let key = UserSettingsKeys.isSoundKeyboard.rawValue
            return standard.bool(forKey: key)
        } set {
            standard.set(newValue, forKey: UserSettingsKeys.isSoundKeyboard.rawValue)
        }
    }
    
    var isHapticKeyboard: Bool {
        get {
            let key = UserSettingsKeys.isHapticKeyboard.rawValue
            return standard.bool(forKey: key)
        } set {
            standard.set(newValue, forKey: UserSettingsKeys.isHapticKeyboard.rawValue)
        }
    }
}
