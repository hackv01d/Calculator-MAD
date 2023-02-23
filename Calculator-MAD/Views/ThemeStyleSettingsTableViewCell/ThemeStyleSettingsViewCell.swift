//
//  ThemeStyleSettingsViewCell.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 19.02.2023.
//

import UIKit

class ThemeStyleSettingsViewCell: UITableViewCell {
    
    static let identifier = "ThemeStyleSettingsViewCell"
    
    // MARK: - Private properties
    
    private let previewImageView = UIImageView()
    private let titleLabel = UILabel()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Сonfigure
    
    func configure(with viewModel: ThemeStyleSettingsViewCellViewModel) {
        titleLabel.text = viewModel.themeTitle
        previewImageView.image = UIImage(named: "\(viewModel.themeTitle)")
    }
    
    // MARK: - Override methods
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupPreviewImageView()
        setupTitleLabel()
    }
    
    private func setupSuperView() {
        backgroundColor = .settingsViewCell
    }
    
    private func setupPreviewImageView() {
        addSubview(previewImageView)
        
        previewImageView.contentMode = .scaleAspectFill
        previewImageView.clipsToBounds = true
        previewImageView.layer.cornerRadius = 13
        
        previewImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(50)
        }
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
