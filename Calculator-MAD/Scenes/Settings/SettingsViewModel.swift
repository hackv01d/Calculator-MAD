//
//  SettingsViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import Foundation

final class SettingsViewModel {
    
    var keyboardSettingsViewModels: [KeyboardSettingsViewCellViewModel]
    var themeStyleSettingsViewModels: [ThemeStyleSettingsViewCellViewModel]
    
    private let settingsSections = SettingsSection.allCases
    private let keyboardSettings = SettingsSection.keyboard
    private let themeStyleSettings = SettingsSection.theme
    
    init() {
        keyboardSettingsViewModels = keyboardSettings.items.map { KeyboardSettingsViewCellViewModel(settingTitle: $0) }
        themeStyleSettingsViewModels = themeStyleSettings.items.map { ThemeStyleSettingsViewCellViewModel(themeTitle: $0) }
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
    
    func shouldHighlightRow(in section: Int) -> Bool {
        switch section {
        case 0: return false
        default: return true
        }
    }
    
    func getHeightForRow(at section: Int) -> CGFloat {
        switch section {
        case 0: return 50
        default: return 70
        }
    }
}
