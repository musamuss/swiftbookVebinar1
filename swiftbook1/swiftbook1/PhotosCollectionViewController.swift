//
//  PhotosCollectionViewController.swift
//  swiftbook1
//
//  Created by Admin on 04/09/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//


import UIKit
 
class PhotosCollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .orange
        setupCollectionView()
        setupNavBar()
    }
    private func setupCollectionView(){
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    private func setupNavBar(){
        let titilelabel = UILabel()
        titilelabel.text = "Photos"
        titilelabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titilelabel.textColor = .blue
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titilelabel)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
              cell.backgroundColor = .red
              return cell
    }
}
