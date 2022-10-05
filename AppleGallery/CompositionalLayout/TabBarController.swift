//
//  TabBarController.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .tertiarySystemFill
        setupTabBarViewControllers()
    }
    
    private func setupTabBarViewControllers() {
        
        let photosController = UINavigationController(rootViewController: ViewController())
        photosController.tabBarItem = UITabBarItem(title: "Медиатека",
                                                   image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                   tag: 0)
        
        let forYouController = UINavigationController(rootViewController: ViewController())
        forYouController.tabBarItem = UITabBarItem(title: "Для Вас",
                                                   image: UIImage(systemName: "heart.text.square.fill"),
                                                   tag: 1)
        
        let albumsController = UINavigationController(rootViewController: ViewController())
        albumsController.tabBarItem = UITabBarItem(title: "Альбомы",
                                                   image: UIImage(systemName: "rectangle.stack.fill"),
                                                   tag: 2)
        
        
        let searchController = UINavigationController(rootViewController: ViewController())
        searchController.tabBarItem = UITabBarItem(title: "Поиск",
                                                   image: UIImage(systemName: "magnifyingglass"),
                                                   tag: 3)
        
        let controllers = [photosController, forYouController, albumsController, searchController]
        self.setViewControllers(controllers, animated: true)
    }
}
