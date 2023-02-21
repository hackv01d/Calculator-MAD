//
//  KeyboardButtonViewCellViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation
import UIKit

final class KeyboardButtonViewCellViewModel {
    
    // MARK: - Private properties
    
    private(set) var title: String
    private(set) var style: KeyboardButtonStyle
    
    // MARK: - Inits
    
    init(title: String, isOperation: Bool, themeStyle: ThemeStyles) {
        self.title = title
        style = isOperation ? .operation(themeStyle) : .command(themeStyle)
    }
}
