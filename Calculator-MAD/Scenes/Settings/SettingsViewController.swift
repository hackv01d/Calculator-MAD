//
//  SettingsViewController.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsTableView = UITableView(frame: .zero, style: .insetGrouped)
    
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
        self.navigationItem.title = "Settings"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        
        setup()
    }

    private func setup() {
        setupSuperView()
        setupSettingsTableView()
    }
    
    private func setupSuperView() {
        view.backgroundColor = .appBackground
    }
    
    private func setupSettingsTableView() {
        view.addSubview(settingsTableView)
        
        settingsTableView.estimatedRowHeight = 70
        settingsTableView.separatorStyle = .singleLine
        settingsTableView.separatorColor = .appGray
        settingsTableView.backgroundColor = .clear
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        settingsTableView.register(KeyboardSettingsViewCell.self, forCellReuseIdentifier: KeyboardSettingsViewCell.identifier)
        settingsTableView.register(ThemeStyleSettingsViewCell.self, forCellReuseIdentifier: ThemeStyleSettingsViewCell.identifier)
        
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        viewModel.shouldHighlightRow(in: indexPath.section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.getHeightForRow(at: indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getTitleSection(section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: KeyboardSettingsViewCell.identifier, for: indexPath) as? KeyboardSettingsViewCell else {
                return KeyboardSettingsViewCell()
            }
            
            cell.configure(with: viewModel.keyboardSettingsViewModels[indexPath.item])
            cell.accessoryView = UISwitch()
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThemeStyleSettingsViewCell.identifier, for: indexPath) as? ThemeStyleSettingsViewCell else {
                return ThemeStyleSettingsViewCell()
            }
            
            cell.configure(with: viewModel.themeStyleSettingsViewModels[indexPath.item])
            return cell
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}
