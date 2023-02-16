//
//  KeyboardButtonViewCellViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation

final class KeyboardButtonViewCellViewModel {
    
    private(set) var style: KeyboardButtonStyle
    private(set) var title: String
    
    init(title: String) {
        self.title = title
        style = ["÷", "×", "+", "-", "="].contains(title) ? .operation : .command
    }
}
