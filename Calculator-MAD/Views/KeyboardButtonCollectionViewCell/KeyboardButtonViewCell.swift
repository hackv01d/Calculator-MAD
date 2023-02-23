//
//  KeyboardButtonViewCell.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import UIKit

protocol KeyboardButtonViewCellDelegate: AnyObject {
    func playSound(_ isHighlighted: Bool)
    func generateHaptic(_ isHighlighted: Bool)
}

final class KeyboardButtonViewCell: UICollectionViewCell {
    
    static let identifier = "KeyboardButtonViewCell"
    
    // MARK: - Public properties
    
    weak var delegate: KeyboardButtonViewCellDelegate?
    
    // MARK: - Override properties
    
    override var isHighlighted: Bool {
        didSet {
            updateAppearance()
            delegate?.playSound(isHighlighted)
            delegate?.generateHaptic(isHighlighted)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            buttonIsSelected()
        }
    }
    
    // MARK: - Private properties
    
    private let keyboardButtonLabel = UILabel()
    private var style: KeyboardButtonStyle?
    
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
        backgroundColor = viewModel.style.primaryBackgroundColor
        keyboardButtonLabel.textColor = viewModel.style.titleColor
        keyboardButtonLabel.text = viewModel.title
        style = viewModel.style
    }
    
    // MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.height / 2.7
    }
    
    // MARK: - Private methods
    
    private func updateAppearance() {
        backgroundColor = isHighlighted ? style?.secondaryBackgroundColor : style?.primaryBackgroundColor
    }
    
    private func buttonIsSelected() {
        backgroundColor = isSelected ? style?.selectedBackgroundColor : style?.primaryBackgroundColor
        keyboardButtonLabel.textColor = isSelected ? style?.selectedTitleColor : style?.titleColor
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
