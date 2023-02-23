//
//  SettingsViewController.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let settingsTableView = UITableView(frame: .zero, style: .insetGrouped)
    private let viewModel: SettingsViewModel
    
    // MARK: - Inits
    
    init(with viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        
        setup()
    }
    
    // MARK: - Actions
    
    @objc
    private func handleDoneBarButton() {
        dismiss(animated: true)
    }
    
    @objc
    private func handleSoundAccessorySwitch() {
        viewModel.switchSound()
    }
    
    @objc
    private func handleHapticAccessorySwitch() {
        viewModel.switchHaptic()
    }
    
    //  MARK: - Setup

    private func setup() {
        setupSuperView()
        setupSettingsTableView()
        setupDoneBarButtonItem()
    }
    
    private func setupSuperView() {
        view.backgroundColor = .appBackground
    }
    
    private func setupSettingsTableView() {
        view.addSubview(settingsTableView)
        
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
    
    private func setupDoneBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneBarButton))
    }
    
    private func setupSoundAccessorySwitch() -> UISwitch {
        let toggleSoundSwitch = UISwitch()
        toggleSoundSwitch.setOn(viewModel.isSound(), animated: true)
        toggleSoundSwitch.addTarget(self, action: #selector(handleSoundAccessorySwitch), for: .valueChanged)
        return toggleSoundSwitch
    }
    
    private func setupHapticAccessorySwitch() -> UISwitch {
        let toggleHapticSwitch = UISwitch()
        toggleHapticSwitch.setOn(viewModel.isHaptic(), animated: true)
        toggleHapticSwitch.addTarget(self, action: #selector(handleHapticAccessorySwitch), for: .valueChanged)
        return toggleHapticSwitch
    }
}

// MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        viewModel.shouldHighlightRow(at: indexPath.section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = viewModel.getSection(at: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .keyboard:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: KeyboardSettingsViewCell.identifier, for: indexPath) as? KeyboardSettingsViewCell else {
                return KeyboardSettingsViewCell()
            }
            
            cell.configure(with: viewModel.keyboardSettingsViewModels[indexPath.item])
            cell.accessoryView = indexPath.row == 0 ? setupSoundAccessorySwitch() : setupHapticAccessorySwitch()
            return cell
        case .theme:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThemeStyleSettingsViewCell.identifier, for: indexPath) as? ThemeStyleSettingsViewCell else {
                return ThemeStyleSettingsViewCell()
            }
            
            cell.configure(with: viewModel.themeStyleSettingsViewModels[indexPath.item])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard viewModel.themeIsSelected(indexPath) else { return }
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.changeThemeStyle(at: indexPath)
    }
}
