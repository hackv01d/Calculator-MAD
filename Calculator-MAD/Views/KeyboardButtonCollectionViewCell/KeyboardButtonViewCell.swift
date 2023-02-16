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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: KeyboardButtonViewCellViewModel) {
        backgroundColor = viewModel.style.primaryBackgroundColor
        keyboardButtonLabel.textColor = viewModel.style.textColor
        keyboardButtonLabel.text = viewModel.title
    }
    
//    private func updateAppearance() {
//        backgroundColor = isHighlighted ? style.secondaryBackgroundColor : style.primaryBackgroundColor
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.width / 2.7
    }
    
    private func setup() {
        setupSuperView()
        setupKeyboardButtonLabel()
    }
    
    private func setupSuperView() {
//        layer.cornerRadius = 30
        clipsToBounds = true
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
