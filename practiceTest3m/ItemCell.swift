//
//  ItemCell.swift
//  practiceTest3m
//
//  Created by mavluda on 3/4/23.
//

import UIKit
import SnapKit

class ItemCell: UICollectionViewCell {

    let image: UIImageView = {
        let view = UIImageView()
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let label = UILabel()
    let timerLabel = UILabel()
    let costLabel = UILabel()
    
    override func layoutSubviews() {
        
        backgroundColor = .white
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.cornerRadius = 15
        
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.height.equalTo(185)
        }
        view.addSubview(label)
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(151)
        }
        
        let timerImage = UIImageView(image: UIImage(named: "Timer"))
        timerImage.contentMode = .scaleAspectFill
        
        addSubview(timerImage)
        timerImage.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(14)
            make.leading.equalTo(label)
            make.width.height.equalTo(20)
        }
        
        timerLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        timerLabel.textColor = UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1)
        
        addSubview(timerLabel)
        timerLabel.snp.makeConstraints { make in
            make.left.equalTo(timerImage.snp.right).offset(6)
            make.centerY.equalTo(timerImage)
        }
        
        costLabel.font = .systemFont(ofSize: 24, weight: .bold)
        costLabel.textColor = UIColor(red: 0.183, green: 0.703, blue: 0, alpha: 1)
        addSubview(costLabel)
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(timerImage.snp.bottom).offset(17)
            make.leading.equalTo(timerImage)
        }
        
        let plusButton: UIButton = {
            let view = UIButton(type: .system)
            view.setTitle("+", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
            view.setTitleColor(.black, for: .normal)
            view.backgroundColor = .white
            view.layer.shadowColor = UIColor.systemGray.cgColor
            view.layer.shadowRadius = 5
            view.layer.shadowOpacity = 0.3
            view.layer.shadowOffset = CGSize(width: 0, height: 0)
            view.layer.cornerRadius = 10
            return view
        }()
        
        addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.bottom.equalTo(costLabel)
            make.trailing.equalToSuperview().inset(18)
        }
        
    }
    
    func fillCell(model: Pizza){
        label.text = model.name
        image.image = UIImage(named: model.image)
        timerLabel.text = model.preparation
        costLabel.text = "$\(model.cost)"
    }
    
}
