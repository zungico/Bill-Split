//
//  PersonView.swift
//  Bill Split
//
//  Created by Вова on 15.02.2023.
//

import UIKit

class PersonView : UIView{
    
    var counter = 0
    
    let countLabel : UILabel = {
        let label = UILabel ()
        label.text = "2"
        label.textColor = #colorLiteral(red: 0.2868391275, green: 0.7150983214, blue: 0.5320858359, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper ()
        stepper.stepValue = 1
        stepper.value = 2
        stepper.minimumValue = 0
        stepper.maximumValue = 30
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperPressed), for: .touchUpInside)
        return stepper
    }()
    
    @objc func stepperPressed () {
        counter = Int(stepper.value)
        countLabel.text = "\(counter)"
        print (counter)
    }
    
    func setupViews () {
        addSubview(countLabel)
        addSubview(stepper)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        countLabel.font = UIFont(name: "Avenir", size: frame.width/4)
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        counter = Int(stepper.value)
//        backgroundColor = .red 
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints () {
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            countLabel.heightAnchor.constraint(equalTo: heightAnchor),
            countLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            stepper.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 0),
            stepper.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }

}
