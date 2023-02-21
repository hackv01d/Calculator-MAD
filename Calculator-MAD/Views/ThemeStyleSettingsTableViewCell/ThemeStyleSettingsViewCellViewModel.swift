//
//  ThemeStyleSettingsViewCellViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 19.02.2023.
//

import Foundation

final class ThemeStyleSettingsViewCellViewModel {
    
    // MARK: - Private properties
    
    private(set) var themeTitle: String
    
    // MARK: - Inits
    
    init(themeTitle: String) {
        self.themeTitle = themeTitle
    }
}
