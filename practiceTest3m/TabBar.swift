//
//  TabBar.swift
//  practiceTest3m
//
//  Created by mavluda on 3/4/23.
//

import Foundation
import UIKit
import SnapKit

class TabBar: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        setupUI()
    }
    
    
    func setupUI(){
        let positionX: CGFloat = 40
        let positionY: CGFloat = 0
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bazierPath = UIBezierPath(roundedRect: CGRect(x: positionX, y: positionY, width: width, height: height * 1.2), cornerRadius: height/3)
        
        roundLayer.path = bazierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 7
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .systemOrange
        
        roundLayer.backgroundColor = UIColor(red: 0.203, green: 0.203, blue: 0.203, alpha: 1).cgColor
        tabBar.barTintColor = .systemGray6
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.isToolbarHidden = true
        navController.navigationBar.isHidden = true
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: MainViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house.fill")!),
            createNavController(for: UIViewController(), title: NSLocalizedString("Favorite", comment: ""), image: UIImage(systemName: "heart.fill")!),
            createNavController(for: UIViewController(), title: NSLocalizedString("Cart", comment: ""), image: UIImage(systemName: "cart.fill")!),
            createNavController(for: UIViewController(), title: NSLocalizedString("My Orders", comment: ""), image: UIImage(systemName: "star.fill")!)
        ]
    }
    
}
