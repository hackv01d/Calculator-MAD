//
//  KeyboardSettingsViewCell.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 18.02.2023.
//

import UIKit

class KeyboardSettingsViewCell: UITableViewCell {
    
    static let identifier = "KeyboardSettingsViewCell"
    
    private let settingTitleLabel = UILabel()
    private let switchSetting = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: KeyboardSettingsViewCellViewModel) {
        settingTitleLabel.text = viewModel.settingTitle
    }
    
    private func setup() {
        setupSuperView()
        setupSettingTitleLabel()
    }
    
    private func setupSuperView() {
        backgroundColor = .settingsViewCell
    }
    
    private func setupSettingTitleLabel() {
        addSubview(settingTitleLabel)
        
        settingTitleLabel.textColor = .white
        settingTitleLabel.font = UIFont.systemFont(ofSize: 18)
        
        settingTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setupSwitchSetting() {
        addSubview(switchSetting)

        switchSetting.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
