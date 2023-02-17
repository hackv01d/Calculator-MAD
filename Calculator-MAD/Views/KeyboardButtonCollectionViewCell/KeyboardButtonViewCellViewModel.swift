//
//  KeyboardButtonViewCellViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation
import UIKit

final class KeyboardButtonViewCellViewModel {
    
    var updateAppearanceOfSelectedButton: ((UIColor) -> Void)?
    
    private(set) var title: String
    private(set) var style: KeyboardButtonStyle
    
    init(title: String, isOperation: Bool) {
        self.title = title
        style = isOperation ? .operation : .command
    }
    
    func setNewAppearance() {
        
    }
}
