//
//  MainTapBarController.swift
//  swiftbook1
//
//  Created by Admin on 04/09/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import UIKit

class MainTapBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        viewControllers = [generateNavigationController(rootViewController: photosVC, title: "Photos"),generateNavigationController(rootViewController: ViewController(), title: "Favourites")]
        
    }
    
    private func generateNavigationController(rootViewController:UIViewController,title:String)->UIViewController{
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        //navigationVC.tabBarItem.image = #imageLiteral(resourceName: <#T##String#>)
        return navigationVC
    }
    
}
