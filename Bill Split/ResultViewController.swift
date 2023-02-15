//
//  ResultViewController.swift
//  Bill Split
//
//  Created by Вова on 15.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
  
    let greenTopView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8889680505, green: 0.9792948365, blue: 0.9476402402, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "Total per person"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let resultBill: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
        label.text = "100"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "Split between 4 people with 20% tip"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recalculateButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Recalculate!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
        button.layer.cornerRadius = 5
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    @objc func recalculateButtonPressed () {
         self.dismiss(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultLabel.font = UIFont(name: "Avenir", size: view.frame.width/13)
        resultBill.font = UIFont(name: "Avenir Next Bold", size: view.frame.width/10)
        descriptionLabel.font = UIFont(name: "Avenir", size: view.frame.width/17)
        recalculateButton.titleLabel?.font = UIFont(name: "Avenir", size: view.frame.width/10)
    }
    
    override func viewDidLoad() {
        setupViews()
        addConstraints()
        view.backgroundColor = .white
    }
    
    func setupViews () {
        view.addSubview(greenTopView)
        view.addSubview(resultLabel)
        view.addSubview(resultBill)
        view.addSubview(descriptionLabel)
        view.addSubview(recalculateButton)
    }
    
    func addConstraints () {
        NSLayoutConstraint.activate([

            greenTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenTopView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            resultLabel.centerXAnchor.constraint(equalTo: greenTopView.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: greenTopView.centerYAnchor),
            resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            resultLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            resultBill.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 0),
            resultBill.centerXAnchor.constraint(equalTo: greenTopView.centerXAnchor),
            resultBill.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            resultBill.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            descriptionLabel.topAnchor.constraint(equalTo: greenTopView.bottomAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            recalculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)

        ])
    }
}
