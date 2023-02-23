//
//  KeyboardButtonViewCell.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import UIKit

final class KeyboardButtonViewCell: UICollectionViewCell {
    
    static let identifier = "KeyboardButtonViewCell"

    // MARK: - Override properties
    
    override var isHighlighted: Bool {
        didSet {
            updateAppearance()
            viewModel?.shouldPlaySound(isHighlighted)
            viewModel?.shouldGenerateHaptic(isHighlighted)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            buttonIsSelected()
        }
    }
    
    // MARK: - Private properties
    
    private let keyboardButtonLabel = UILabel()
    private var viewModel: KeyboardButtonViewCellViewModel?
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupKeyboardButtonLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(with viewModel: KeyboardButtonViewCellViewModel) {
        self.viewModel = viewModel
        backgroundColor = viewModel.style.primaryBackgroundColor
        keyboardButtonLabel.textColor = viewModel.style.titleColor
        keyboardButtonLabel.text = viewModel.title
    }
    
    // MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.height / 2.7
    }
    
    // MARK: - Private methods
    
    private func updateAppearance() {
        backgroundColor = isHighlighted ? viewModel?.style.secondaryBackgroundColor : viewModel?.style.primaryBackgroundColor
    }
    
    private func buttonIsSelected() {
        backgroundColor = isSelected ? viewModel?.style.selectedBackgroundColor : viewModel?.style.primaryBackgroundColor
        keyboardButtonLabel.textColor = isSelected ? viewModel?.style.selectedTitleColor : viewModel?.style.titleColor
    }
    
    // MARK: - Setup
    
    private func setupKeyboardButtonLabel() {
        addSubview(keyboardButtonLabel)
        
        keyboardButtonLabel.textAlignment = .center
        keyboardButtonLabel.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        
        keyboardButtonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
