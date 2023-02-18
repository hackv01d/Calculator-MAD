//
//  SettingsViewController.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let viewModel: SettingsViewModel
    
    init(with viewModel: SettingsViewModel) {
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
    }
    
    private func setupSuperView() {
        view.backgroundColor = .systemIndigo
    }

}
