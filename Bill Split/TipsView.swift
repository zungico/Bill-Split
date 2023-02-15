//
//  TipsView.swift
//  Bill Split
//
//  Created by Вова on 14.02.2023.
//

import UIKit


class TipsView : UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsViewCell else {
            return UICollectionViewCell()
        }
        cell.procentLabel.text = tipsArray[indexPath.row]
        return cell
        
    }
    
    let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView (frame: .zero, collectionViewLayout: collectionLayout)
        collection.backgroundColor = #colorLiteral(red: 0.8889680505, green: 0.9792948365, blue: 0.9476402402, alpha: 1)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/3.5, height: collectionView.frame.width/8)
    }
    
    var tipsCount = 0
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: tipsCount = 10
        case 2: tipsCount = 20
        default: tipsCount = 0
        }
    }
    
    
    let tipsArray = ["0%", "10%", "20%"]
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("SOS")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.register(TipsViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setConstraints () {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
    func setDelegates () {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}
