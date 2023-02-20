//
//  CalculatorViewModel.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import Foundation
import UIKit
import AudioToolbox

final class CalculatorViewModel {
    
    var updateCollection: (() -> Void)?
    var updateThemeStyle: ((ThemeStyles) -> Void)?
    var updateResult: ((String) -> Void)?
    var updateExpression: ((String) -> Void)?
    var showCalculateError: ((String, ThemeStyles) -> Void)?
    var didGoToSettingsScreen: ((UINavigationController) -> Void)?
    
    
    private(set) var header = "Calculator"
    private let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
    
    private var isSoundKeyboard: Bool {
        didSet {
            UserSettings.shared.isSoundKeyboard = isSoundKeyboard
        }
    }
    private var isHapticKeyboard: Bool {
        didSet {
            UserSettings.shared.isHapticKeyboard = isHapticKeyboard
        }
    }
    
    private(set) var themeStyle: ThemeStyles {
        didSet {
            UserSettings.shared.themeStyle = themeStyle
            updateCellViewModels()
            updateThemeStyle?(themeStyle)
        }
    }
    
    var cellViewModels: [KeyboardButtonViewCellViewModel] = [] {
        didSet {
            updateCollection?()
        }
    }
    
    private let keyboardButtons: [KeyboardButtons] = [
        .allClear, .plusMinus, .percent, .divide,
        .digit(7), .digit(8), .digit(9), .multiply,
        .digit(4), .digit(5), .digit(6), .minus,
        .digit(1), .digit(2), .digit(3), .plus,
        .digit(0), .decimal, .equal
    ]
    
    private let model: Calculator

    init(with model: Calculator) {
        self.model = model
        self.themeStyle = UserSettings.shared.themeStyle
        isSoundKeyboard = UserSettings.shared.isSoundKeyboard
        isHapticKeyboard = UserSettings.shared.isHapticKeyboard
        updateCellViewModels()
    }
    
    func getInitialResult() -> String {
        return model.currentNumber
    }
    
    func getInitialExpression() -> String {
        return model.fullExpression
    }
    
    func removeDigit() {
        guard let value = model.deleteLastDigit() else { return }
        updateResult?(value.replaceDecimal)
    }
    
    func showSettingsScreen() {
        let viewModel = SettingsViewModel()
        viewModel.delegate = self
        let viewController = SettingsViewController(with: viewModel)
        let navController = UINavigationController(rootViewController: viewController)
        didGoToSettingsScreen?(navController)
    }
    
    func touchOnCalculatorButton(at index: Int) {
        let title = keyboardButtons[index].title.replacingOccurrences(of: ",", with: ".")
        
        switch title {
        case "AC":
            reset()
        case "±":
            addPlusMinus()
        case "%":
            getPercent()
        case "=":
            getResult()
        case "÷", "×", "-", "+":
            updateOperation(title)
        default:
            addDigit(title)
        }
    }
    
    private func reset() {
        model.resetData()
        updateResult?("0")
        updateExpression?("")
    }
    
    private func addDigit(_ title: String) {
        guard let value = model.addNewDigit(digit: title) else { return }
        updateResult?(value.replaceDecimal)
    }
    
    private func addPlusMinus() {
        guard let value = model.changeSign() else { return }
        updateResult?(value.replaceDecimal)
    }
    
    private func getPercent() {
        guard let (value, expression) = model.getPercent() else { return }
        
        updateResult?(value.replaceDecimal)
        updateExpression?(expression.replaceDecimal)
    }
    
    private func getResult() {
        guard !isDivisionError() else { return }
        guard let (value, expression) = model.getResult() else { return }
        
        updateResult?(value.replaceDecimal)
        updateExpression?(expression.replaceDecimal)
    }
    
    private func updateOperation(_ title: String) {
        guard !isDivisionError() else { return }
        guard let (value, expression) = model.setOperation(currentOperation: title) else { return }
        
        updateResult?(value.replaceDecimal)
        updateExpression?(expression.replaceDecimal)
    }
    
    private func isDivisionError() -> Bool {
        guard model.checkDivisionByZero() else { return false }
        
        showCalculateError?("Error", themeStyle)
        return true
    }
    
    private func updateCellViewModels() {
        cellViewModels = keyboardButtons.map { KeyboardButtonViewCellViewModel.init(title: $0.title,
                                                                                    isOperation: $0.isOperation,
                                                                                    themeStyle: themeStyle) }
    }
}

extension CalculatorViewModel: SettingsViewModelDelegate {
    func toggleSoundKeyboard() {
        isSoundKeyboard = !isSoundKeyboard
    }
    
    func toggleHapticKeyboard() {
        isHapticKeyboard = !isHapticKeyboard
    }
    
    func updateThemeStyle(_ themeStyle: ThemeStyles) {
        self.themeStyle = themeStyle
    }
}

extension CalculatorViewModel: KeyboardButtonViewCellDelegate {
    func playSound(_ isHighlighted: Bool) {
        guard isHighlighted, isSoundKeyboard else { return }
        
        AudioServicesPlaySystemSound(1104)
    }
    
    func generateHaptic(_ isHighlighted: Bool) {
        guard isHighlighted, isHapticKeyboard else { return }
        
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
}

