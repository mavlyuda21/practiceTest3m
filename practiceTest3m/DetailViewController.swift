//
//  DetailViewController.swift
//  practiceTest3m
//
//  Created by mavluda on 3/4/23.
//

import Foundation
import UIKit
import SnapKit

class DetailViewController: UIViewController{
    
    let nameLabel = UILabel()
    
    var cost = 0
    var amount = 1
    
    let costLabel = UILabel()
    
    let counterLabel: UILabel = {
        let view = UILabel()
         view.font = .systemFont(ofSize: 28, weight: .bold)
         view.textColor = .black
         view.textAlignment = .center
         return view
     }()
    
    let imageView: UIImageView = {
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
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 35
        layout.estimatedItemSize = CGSize(width: 90, height: 35)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TypesCell.self, forCellWithReuseIdentifier: "cell")
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.alwaysBounceHorizontal = true
        return collection
    }()
    
    let sizes = ["8 inch","20 inch","32 inch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tabBarController?.tabBar.isHidden = true
        
        let backButton: UIButton = {
            let view = UIButton(type: .system)
            view.setBackgroundImage(UIImage(named: "back btn"), for: .normal)
            view.backgroundColor = .white
            view.imageView?.contentMode = .scaleAspectFill
            
            view.addTarget(nil, action: #selector(backButtonTapped(button:)), for: .touchUpInside)
            return view
        }()
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(55)
            make.top.equalToSuperview().offset(44)
            make.leading.equalToSuperview().inset(15)
        }
        
        let detailLabel: UILabel = {
           let view = UILabel()
            view.text = "Detail"
            view.font = .systemFont(ofSize: 26, weight: .medium)
            view.textColor = .black
            view.textAlignment = .left
            return view
        }()
        
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(backButton)
        }
        
        let heartButton: UIButton = {
            let view = UIButton(type: .system)
            view.setBackgroundImage(UIImage(named: "favorite btn"), for: .normal)
            view.backgroundColor = .white
            view.imageView?.contentMode = .scaleAspectFit
            return view
        }()
        
        view.addSubview(heartButton)
        heartButton.snp.makeConstraints { make in
            make.width.height.equalTo(55)
            make.top.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().inset(15)
        }
        
        nameLabel.font = .systemFont(ofSize: 38, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(detailLabel.snp.bottom).offset(30)
            make.width.equalTo(210)
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.height.equalTo(230)
            make.width.equalTo(300)
        }
        
        let chooseLabel: UILabel = {
           let view = UILabel()
            view.text = "Choose the size"
            view.font = .systemFont(ofSize: 22, weight: .medium)
            view.textColor = .black
            view.textAlignment = .center
            return view
        }()
        
        view.addSubview(chooseLabel)
        chooseLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(20)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(chooseLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        let counterView = UIView()
        counterView.backgroundColor = .systemGray6
        counterView.layer.cornerRadius = 15
        counterView.clipsToBounds = true
        
        view.addSubview(counterView)
        counterView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(97)
            make.height.equalTo(70)
        }
        
        counterView.addSubview(counterLabel)
        counterLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        if amount < 10{
            counterLabel.text = "0\(amount)"
        }else{
            counterLabel.text = "\(amount)"
        }
        
        let plusButton: UIButton = {
            let view = UIButton(type: .system)
            view.setBackgroundImage(UIImage(named: "Add"), for: .normal)
            view.addTarget(nil, action: #selector(plusButtonTapped(button:)), for: .touchUpInside)
            return view
        }()
        
        counterView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(35)
            make.left.equalTo(counterLabel.snp.right).offset(25)
        }
        
        let minusButton: UIButton = {
            let view = UIButton(type: .system)
            view.setBackgroundImage(UIImage(named: "Remove"), for: .normal)
            view.addTarget(nil, action: #selector(minusButtonTapped(button:)), for: .touchUpInside)
            return view
        }()
        
        counterView.addSubview(minusButton)
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(35)
            make.right.equalTo(counterLabel.snp.left).offset(-25)
        }
        
        let priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        priceLabel.textColor = UIColor(red: 0.718, green: 0.718, blue: 0.718, alpha: 1)
        priceLabel.text = "Price"
        
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(counterView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(26)
        }
        
        costLabel.font = .systemFont(ofSize: 24, weight: .bold)
        costLabel.textColor = UIColor(red: 0.183, green: 0.703, blue: 0, alpha: 1)
        
        view.addSubview(costLabel)
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.leading.equalTo(priceLabel)
        }
        
        let addToButton: UIButton = {
            let view = UIButton(type: .system)
            view.setTitle("Add to Cart", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 22,weight: .bold)
            view.setTitleColor(.white, for: .normal)
            view.backgroundColor = .systemOrange
            view.clipsToBounds = true
            view.layer.cornerRadius = 15
            return view
        }()
        
        view.addSubview(addToButton)
        addToButton.snp.makeConstraints { make in
            make.centerY.equalTo(costLabel.snp.top).offset(5)
            make.width.equalTo(180)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        
    }
    
    @objc func backButtonTapped(button: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    func fill(model: Pizza){
        nameLabel.text = model.name
        imageView.image = UIImage(named: model.secondImage)
        cost = model.cost
        
        costLabel.text = "$\(cost).00"
    }
    
    @objc func plusButtonTapped(button: UIButton){
        amount += 1
        if amount < 10{
            counterLabel.text = "0\(amount)"
        }else{
            counterLabel.text = "\(amount)"
        }
        costLabel.text = "$\(cost * amount).00"
    }
    
    @objc func minusButtonTapped(button: UIButton){
        if amount > 0{
            amount -= 1
            if amount < 10{
                counterLabel.text = "0\(amount)"
            }else if amount >= 0{
                counterLabel.text = "\(amount)"
            }else{
                counterLabel.text = "00"
            }
            costLabel.text = "$\(cost * amount).00"
        }
    }
    
}


extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TypesCell
        cell.fill(text: sizes[indexPath.row])
        return cell
    }
}
