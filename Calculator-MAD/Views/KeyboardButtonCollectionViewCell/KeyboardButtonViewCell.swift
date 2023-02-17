//
//  KeyboardButtonViewCell.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import UIKit

final class KeyboardButtonViewCell: UICollectionViewCell {
    
    static let identifier = "KeyboardButtonViewCell"
    
    private let keyboardButtonLabel = UILabel()
    private var style: KeyboardButtonStyle?
    
    override var isHighlighted: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupKeyboardButtonLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: KeyboardButtonViewCellViewModel) {
        backgroundColor = viewModel.style.primaryBackgroundColor
        keyboardButtonLabel.textColor = viewModel.style.textColor
        keyboardButtonLabel.text = viewModel.title
        style = viewModel.style
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.height / 2.7
    }
    
    private func updateAppearance() {
        guard let style = style else { return }
        backgroundColor = isHighlighted ? style.secondaryBackgroundColor : style.primaryBackgroundColor
    }
    
    private func setupKeyboardButtonLabel() {
        addSubview(keyboardButtonLabel)
        
        keyboardButtonLabel.textAlignment = .center
        keyboardButtonLabel.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        
        keyboardButtonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
