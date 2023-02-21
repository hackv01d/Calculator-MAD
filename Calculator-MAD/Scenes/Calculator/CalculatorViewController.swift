//
//  CalculatorViewController.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let headerLabel = UILabel()
    private let settingsButton = UIButton()
    private let resultWindowView = UIView()
    
    private let fullExpressionLabel = UILabel()
    private let resultCalculatedLabel = UILabel()
    private let deleteDigitButton = UIButton()
    
    private let underlineView = UIView()
    
    private lazy var keyboardCollection: UICollectionView = {
        let layout = KeyboardButtonLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    private let viewModel: CalculatorViewModel
    
    // MARK: - Inits
    
    init(with viewModel: CalculatorViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        bindToViewModel()
    }
    
    // MARK: - Actions
    
    @objc
    private func handleSettingsButton() {
        viewModel.showSettingsScreen()
    }
    
    @objc
    private func handleDeleteDigitButton() {
        viewModel.removeDigit()
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupHeaderLabel()
        setupSettingsButton()
        setupResultWindowView()
        setupDeleteDigitButton()
        setupResultCalculatedLabel()
        setupFullExpressionLabel()
        setupBorderView()
        setupKeyboardCollection()
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
    
    private func setupSettingsButton() {
        view.addSubview(settingsButton)
        
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
        settingsButton.setImage(UIImage(systemName: "gearshape", withConfiguration: config), for: .normal)
        settingsButton.tintColor = .appGray
        settingsButton.addTarget(self, action: #selector(handleSettingsButton), for: .touchUpInside)
        
        settingsButton.snp.makeConstraints { make in
            make.bottom.top.equalTo(headerLabel)
            make.trailing.equalToSuperview().inset(30)
        }
    }
    
    private func setupResultWindowView() {
        view.addSubview(resultWindowView)
        
        resultWindowView.backgroundColor = .clear
        resultWindowView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalToSuperview().multipliedBy(0.29)
        }
    }
    
    private func setupDeleteDigitButton() {
        resultWindowView.addSubview(deleteDigitButton)
        
        let config = UIImage.SymbolConfiguration(pointSize: 27, weight: .medium)
        deleteDigitButton.setImage(UIImage(systemName: "delete.left", withConfiguration: config), for: .normal)
        deleteDigitButton.tintColor = .appGray
        deleteDigitButton.addTarget(self, action: #selector(handleDeleteDigitButton), for: .touchUpInside)
        
        deleteDigitButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().multipliedBy(0.85)
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func setupResultCalculatedLabel() {
        resultWindowView.addSubview(resultCalculatedLabel)
        
        resultCalculatedLabel.text = viewModel.getInitialResult()
        resultCalculatedLabel.textColor = viewModel.themeStyle.resultTitle
        resultCalculatedLabel.font = UIFont.systemFont(ofSize: 67, weight: .bold)
        resultCalculatedLabel.textAlignment = .right
        resultCalculatedLabel.adjustsFontSizeToFitWidth = true
        resultCalculatedLabel.minimumScaleFactor = 0.2
        resultCalculatedLabel.numberOfLines = 1
        
        resultCalculatedLabel.backgroundColor = .clear
        
        resultCalculatedLabel.snp.makeConstraints { make in
            make.bottom.equalTo(deleteDigitButton.snp.top).multipliedBy(0.8)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupFullExpressionLabel() {
        resultWindowView.addSubview(fullExpressionLabel)

        fullExpressionLabel.text = viewModel.getInitialExpression()
        fullExpressionLabel.textColor = viewModel.themeStyle.expressionTitle
        fullExpressionLabel.font = UIFont.systemFont(ofSize: 25)
        fullExpressionLabel.textAlignment = .right
        fullExpressionLabel.adjustsFontSizeToFitWidth = true
        fullExpressionLabel.minimumScaleFactor = 0.2
        fullExpressionLabel.numberOfLines = 1
        
        fullExpressionLabel.backgroundColor = .clear

        fullExpressionLabel.snp.makeConstraints { make in
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
    
    private func setupKeyboardCollection() {
        view.addSubview(keyboardCollection)
        
        keyboardCollection.backgroundColor = .clear
        keyboardCollection.isScrollEnabled = false
        keyboardCollection.register(KeyboardButtonViewCell.self, forCellWithReuseIdentifier: KeyboardButtonViewCell.identifier)
        keyboardCollection.dataSource = self
        keyboardCollection.delegate = self
        keyboardCollection.contentMode = .center
        
        keyboardCollection.snp.makeConstraints { make in
            make.top.equalTo(resultWindowView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension CalculatorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardButtonViewCell.identifier, for: indexPath) as? KeyboardButtonViewCell else {
            return KeyboardButtonViewCell()
        }
        
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        cell.delegate = viewModel
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CalculatorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.touchOnCalculatorButton(at: indexPath.item)
    }
}

// MARK: - Building ViewModel

private extension CalculatorViewController {
    private func bindToViewModel() {
        viewModel.updateCollection = { [weak self] in
            self?.keyboardCollection.reloadData()
        }
        
        viewModel.updateResult = { [weak self] result in
            self?.resultCalculatedLabel.text = result
        }
        
        viewModel.updateExpression = { [weak self] expression in
            self?.fullExpressionLabel.text = expression
        }
        
        viewModel.updateThemeStyle = { [weak self] themeStyle in
            self?.resultCalculatedLabel.textColor = themeStyle.resultTitle
            self?.fullExpressionLabel.textColor = themeStyle.expressionTitle
        }
        
        viewModel.showCalculateError = { [weak self] error, themeStyle in
            self?.resultCalculatedLabel.text = error
            self?.resultCalculatedLabel.textColor = themeStyle.errorTitle
        }
        
        viewModel.didGoToSettingsScreen = { [weak self] navController in
            navController.overrideUserInterfaceStyle = .dark
            navController.modalPresentationStyle = .formSheet
            self?.present(navController, animated: true)
        }
    }
}
