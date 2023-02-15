//
//  ViewController.swift
//  Bill Split
//
//  Created by Вова on 14.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let whiteTopView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill:"
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e.g. 123 456"
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.textColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
        textField.adjustsFontSizeToFitWidth = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
        return textField
    }()
    
    let selectTipLabel: UILabel = {
        let label = UILabel()
        label.text = "Select tip:"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tipsView = TipsView ()
    
    let chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose split:"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let personView = PersonView ()
    
    let calculateButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    @objc func calculateButtonPressed () {
        guard let totalBill = textField.text else { return }
        guard let totalBillInt = Int(totalBill) else { return }
        let tips = tipsView.tipsCount
        let people = personView.counter
        
        let result = (totalBillInt + (totalBillInt * tips/100)) / people
        let resultViewController = ResultViewController()
        
        resultViewController.resultBill.text = "\(result)"
        resultViewController.descriptionLabel.text = "Split between \(people) people with \(tips)% tip"
        
        let navVC = UINavigationController(rootViewController: resultViewController)
        present(navVC, animated: true)
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8889680505, green: 0.9792948365, blue: 0.9476402402, alpha: 1)
        setupViews()
        setConstraints()
        addTap()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        enterLabel.font = UIFont(name: "Avenir", size: view.frame.width/17)
        textField.font = UIFont(name: "Avenir", size: view.frame.width/10)
        selectTipLabel.font = UIFont(name: "Avenir", size: view.frame.width/17)
        chooseSplitLabel.font = UIFont(name: "Avenir", size: view.frame.width/17)
        calculateButton.titleLabel?.font = UIFont(name: "Avenir", size: view.frame.width/10)
    }

    func setupViews() {
        view.addSubview(whiteTopView)
        view.addSubview(enterLabel)
        view.addSubview(textField)
        view.addSubview(selectTipLabel)
        view.addSubview(tipsView)
        view.addSubview(chooseSplitLabel)
        view.addSubview(personView)
        view.addSubview(calculateButton)
    }
    
    func addTap () {
        let tap = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
    }
    
    @objc func hideKeyboard () {
        view.endEditing(true)
    }
    
    func setConstraints () {
        NSLayoutConstraint.activate([
            whiteTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            whiteTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            whiteTopView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            enterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            enterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            enterLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            textField.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            textField.heightAnchor.constraint(equalTo: whiteTopView.heightAnchor, multiplier: 0.25),
            
            selectTipLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            selectTipLabel.topAnchor.constraint(equalTo: whiteTopView.bottomAnchor, constant: 20),
            selectTipLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            tipsView.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            chooseSplitLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            chooseSplitLabel.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 20),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            personView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 20),
            personView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            personView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
       
    }
    


}


