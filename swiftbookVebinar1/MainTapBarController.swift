//
//  MainTapBarController.swift
//  swiftbookVebinar1
//
//  Created by Admin on 30/08/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import UIKit
class MainTapBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewLayout())

        viewControllers = [generateNavigationController(rootViewController: photosVC, title: "Photos"),
        generateNavigationController(rootViewController: ViewController(), title: "Favourites")
        ]
    }
    
    //функция генерации названия- кнопки tapbar
    private func generateNavigationController(rootViewController: UIViewController, title: String) ->UIViewController{
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        return navigationVC
    }
}
