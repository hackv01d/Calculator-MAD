//
//  KeyboardSettingsViewCellViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import Foundation

final class KeyboardSettingsViewCellViewModel {
    
    // MARK: - Private properties
    
    private(set) var settingTitle: String
    
    // MARK: - Inits
    
    init(settingTitle: String) {
        self.settingTitle = settingTitle
    }
}
