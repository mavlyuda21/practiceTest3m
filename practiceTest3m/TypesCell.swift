//
//  TypesCell.swift
//  practiceTest3m
//
//  Created by mavluda on 3/4/23.
//

import UIKit
import SnapKit

class TypesCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override func layoutSubviews(){
        
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .center
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(35)
        }
    }
    
    func fill(text: String){
        label.text = text
    }
}
