//
//  MainViewController.swift
//  practiceTest3m
//
//  Created by mavluda on 3/4/23.
//

import Foundation
import UIKit
import SnapKit

class MainViewController: UIViewController{
    
    let searchBar = UISearchBar()
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
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
    
    let secondCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 48 , height: 184)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 15, right: 5)
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ItemCell.self, forCellWithReuseIdentifier: "secondCell")
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.alwaysBounceHorizontal = true
        return collection
    }()
    
    let types = ["All","Pizza","Fast Food","Vegan"]
    let pizzas = [Pizza(name: "Pizza with Mushrooms", preparation: "14-20 minutes", image: "pizza", cost: 12, secondImage: "pizza-2"),
                  Pizza(name: "Pepperoni Cheese Pizza", preparation: "18-25 minutes", image: "Pepperoni-Pizza 1", cost: 14,secondImage: "pizza-2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        overrideUserInterfaceStyle = .light
        
        let topView = UIView()
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.height.equalTo(69)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        let helloLabel: UILabel = {
           let view = UILabel()
            view.text = "Hello Mehrab"
            view.font = .systemFont(ofSize: 18, weight: .semibold)
            view.textColor = .systemGray2
            view.textAlignment = .left
            return view
        }()
        
        topView.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        let welcomeLabel: UILabel = {
           let view = UILabel()
            view.text = "Welcome Back !"
            view.font = .systemFont(ofSize: 32, weight: .bold)
            view.textColor = .black
            view.textAlignment = .left
            return view
        }()
        
        topView.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
        
        let notificationImage = UIImageView(image: UIImage(named: "Notifications"))
        topView.addSubview(notificationImage)
        notificationImage.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        
        searchBar.placeholder = "Search"
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true
        searchBar.layer.backgroundColor = UIColor.clear.cgColor
        searchBar.backgroundColor = .systemGray6
        searchBar.isUserInteractionEnabled = false
        let searchView = UIView()
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(36)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(55)
        }
        
        let filterButton: UIButton = {
            let view = UIButton(type: .system)
            view.setBackgroundImage(UIImage(named: "filter"), for: .normal)
            view.setTitle("", for: .normal)
            return view
        }()
        
        searchView.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(2)
            make.width.height.equalTo(75)
            make.trailing.equalToSuperview()
        }
        
        searchView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalTo(filterButton.snp.left).offset(-25)
        }
        
        searchBar.barTintColor = UIColor(red: 0.932, green: 0.932, blue: 0.932, alpha: 1)
        searchBar.searchTextField.backgroundColor = UIColor(red: 0.932, green: 0.932, blue: 0.932, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(46)
            make.height.equalTo(45)
            make.leading.equalToSuperview().offset(24)
            make.right.equalToSuperview()
        }
        
        view.addSubview(secondCollectionView)
        secondCollectionView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(14)
            make.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
        
        secondCollectionView.dataSource = self
        secondCollectionView.delegate = self
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.isEqual(secondCollectionView){
            return pizzas.count
        }else{
            return types.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.isEqual(secondCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as! ItemCell
            cell.fillCell(model: pizzas[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TypesCell
            cell.fill(text: types[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.isEqual(secondCollectionView){
            let vc = DetailViewController()
            vc.fill(model: pizzas[indexPath.row])
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
