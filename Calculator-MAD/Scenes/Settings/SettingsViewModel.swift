//
//  SettingsViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import Foundation

protocol SettingsViewModelDelegate: AnyObject {
    func toggleSoundKeyboard()
    func toggleHapticKeyboard()
    func updateThemeStyle(_ themeStyle: ThemeStyles)
}

final class SettingsViewModel {
    
    // MARK: - Public properties
    
    var keyboardSettingsViewModels = [KeyboardSettingsViewCellViewModel]()
    var themeStyleSettingsViewModels = [ThemeStyleSettingsViewCellViewModel]()
    weak var delegate: SettingsViewModelDelegate?
    
    // MARK: - Private properties
    
    private let settingsSections = SettingsSection.allCases
    private let themeStyles = ThemeStyles.allCases
    private var activeThemeStyle: ThemeStyles
    
    // MARK: - Inits
    
    init() {
        activeThemeStyle = UserSettings.shared.themeStyle
        keyboardSettingsViewModels = SettingsSection.keyboard.items.map { KeyboardSettingsViewCellViewModel(settingTitle: $0) }
        themeStyleSettingsViewModels = SettingsSection.theme.items.map { ThemeStyleSettingsViewCellViewModel(themeTitle: $0) }
    }
    
    // MARK: - Public methods
    
    func switchSound() {
        delegate?.toggleSoundKeyboard()
    }
    
    func switchHaptic() {
        delegate?.toggleHapticKeyboard()
    }
    
    func isSound() -> Bool {
        return UserSettings.shared.isSoundKeyboard
    }
    
    func isHaptic() -> Bool {
        return UserSettings.shared.isHapticKeyboard
    }
    
    func getSection(at index: Int) -> SettingsSection? {
        return SettingsSection(rawValue: index)
    }
    
    func getNumberOfSections() -> Int {
        return settingsSections.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return settingsSections[section].items.count
    }
    
    func getTitleSection(_ section: Int) -> String {
        return settingsSections[section].title
    }
    
    func themeIsSelected(_ indexPath: IndexPath) -> Bool {
        guard getSection(at: indexPath.section) == .theme else { return false }
        return activeThemeStyle == themeStyles[indexPath.row]
    }
    
    func changeThemeStyle(at indexPath: IndexPath) {
        guard getSection(at: indexPath.section) == .theme else { return }
        delegate?.updateThemeStyle(themeStyles[indexPath.row])
    }
    
    func getHeightForRow(at index: Int) -> CGFloat {
        guard let section = SettingsSection(rawValue: index) else { return 60 }
        
        switch section {
        case .keyboard:
            return 50
        case .theme:
            return 60
        }
    }
    
    func shouldHighlightRow(at index: Int) -> Bool {
        guard let section = SettingsSection(rawValue: index) else { return false }
        
        switch section {
        case .keyboard:
            return false
        case .theme:
            return true
        }
    }
}
