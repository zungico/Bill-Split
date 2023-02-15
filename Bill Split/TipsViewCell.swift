//
//  TipsViewCell.swift
//  Bill Split
//
//  Created by Вова on 14.02.2023.
//

import UIKit

class TipsViewCell : UICollectionViewCell{
    
    let procentLabel : UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                procentLabel.textColor = #colorLiteral(red: 0.8889680505, green: 0.9792948365, blue: 0.9476402402, alpha: 1)
                procentLabel.backgroundColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
                procentLabel.layer.cornerRadius = 10
                
            } else {
                procentLabel.textColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
                procentLabel.backgroundColor = #colorLiteral(red: 0.8889680505, green: 0.9792948365, blue: 0.9476402402, alpha: 1)
            }
        }
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("SOS")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        procentLabel.font = UIFont(name: "Avenir", size: frame.height)
    }
    
    func setupViews () {
        addSubview(procentLabel)
//        layer.cornerRadius = 15
    }
    
    func setConstraints () {
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            procentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
}
