//
//  CalculatorScreenViewController.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import UIKit
import SnapKit

class CalculatorScreenViewController: UIViewController {
    
    private let headerLabel = UILabel()
    
    private let resultWindowView = UIView()
    private let fullExpressionLabel = UILabel()
    private let resultCalculatedLabel = UILabel()
    private let deleteDigitButton = UIButton()
    private let underlineView = UIView()
    
    private let viewModel: CalculatorScreenViewModel
    
    
    init(with viewModel: CalculatorScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        setupSuperView()
        setupHeaderLabel()
        setupResultWindowView()
        setupDeleteDigitButton()
        setupResultCalculatedLabel()
        setupFullExpressionLabel()
        setupBorderView()
    }
    
    private func setupSuperView() {
        view.backgroundColor = .appBackground
    }
    
    private func setupHeaderLabel() {
        view.addSubview(headerLabel)
        
        headerLabel.text = viewModel.header
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        headerLabel.textAlignment = .left
        
        headerLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
    }
    
    private func setupResultWindowView() {
        view.addSubview(resultWindowView)
        
        resultWindowView.backgroundColor = .clear
        resultWindowView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalToSuperview().multipliedBy(0.33)
        }
    }
    
    private func setupDeleteDigitButton() {
        resultWindowView.addSubview(deleteDigitButton)
        
        let config = UIImage.SymbolConfiguration(pointSize: 27, weight: .medium)
        deleteDigitButton.setImage(UIImage(systemName: "delete.left", withConfiguration: config), for: .normal)
        deleteDigitButton.tintColor = .appGray
        
        deleteDigitButton.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().inset(35)
            make.bottom.equalToSuperview().multipliedBy(0.85)
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func setupResultCalculatedLabel() {
        resultWindowView.addSubview(resultCalculatedLabel)
        
        resultCalculatedLabel.text = viewModel.getInitialResult()
        resultCalculatedLabel.textColor = .resultText
        resultCalculatedLabel.font = UIFont.systemFont(ofSize: 65, weight: .bold)
        resultCalculatedLabel.textAlignment = .right
        resultCalculatedLabel.adjustsFontSizeToFitWidth = true
        resultCalculatedLabel.minimumScaleFactor = 0.2
        resultCalculatedLabel.numberOfLines = 1
        
        resultCalculatedLabel.backgroundColor = .clear
        
        resultCalculatedLabel.snp.makeConstraints { make in
//            make.bottom.equalTo(deleteDigitButton.snp.top).offset(-40)
            make.bottom.equalTo(deleteDigitButton.snp.top).multipliedBy(0.8)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupFullExpressionLabel() {
        resultWindowView.addSubview(fullExpressionLabel)

        fullExpressionLabel.text = viewModel.getInitialExpression()
        fullExpressionLabel.textColor = .expressionText
        fullExpressionLabel.font = UIFont.systemFont(ofSize: 25)
        fullExpressionLabel.textAlignment = .right
        fullExpressionLabel.adjustsFontSizeToFitWidth = true
        fullExpressionLabel.minimumScaleFactor = 0.2
        fullExpressionLabel.numberOfLines = 1
        
        fullExpressionLabel.backgroundColor = .clear

        fullExpressionLabel.snp.makeConstraints { make in
//            make.bottom.equalTo(resultCalculatedLabel.snp.top).offset(-30)
            make.bottom.equalTo(resultCalculatedLabel.snp.top).multipliedBy(0.7)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func setupBorderView() {
        resultWindowView.addSubview(underlineView)
        
        underlineView.backgroundColor = .appGray
        underlineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }

}
