//
//  KeyboardButtonViewCellViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation
import UIKit

protocol KeyboardButtonViewCellViewModelDelegate: AnyObject {
    func playSound(_ isHighlighted: Bool)
    func generateHaptic(_ isHighlighted: Bool)
}

final class KeyboardButtonViewCellViewModel {
    
    weak var delegate: KeyboardButtonViewCellViewModelDelegate?
    
    // MARK: - Private properties
    
    private(set) var title: String
    private(set) var style: KeyboardButtonStyle
    private let isOperation: Bool
    
    // MARK: - Inits
    
    init(title: String, isOperation: Bool, themeStyle: ThemeStyles) {
        self.title = title
        self.isOperation = isOperation
        style = isOperation ? .operation(themeStyle) : .command(themeStyle)
    }
    
    // MARK: - Public methods
    
    func updateThemeStyle(with themeStyle: ThemeStyles) {
        style = isOperation ? .operation(themeStyle) : .command(themeStyle)
    }
    
    func shouldPlaySound(_ isHighlighted: Bool) {
        delegate?.playSound(isHighlighted)
    }
    
    func shouldGenerateHaptic(_ isHighlighted: Bool) {
        delegate?.generateHaptic(isHighlighted)
    }
}
