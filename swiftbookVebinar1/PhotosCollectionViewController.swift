//
//  PhotosCollectionViewController.swift
//  swiftbookVebinar1
//
//  Created by Admin on 30/08/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import UIKit
class PhotosCollectionViewController: UICollectionViewController {
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
        setupNavigationBar()
        setupCollectionView()
        setupSearchBar()
    }
    // MARK: - NAvigation items action
    @objc private func addBarButtonTapped(){
        print(#function)
    }
    @objc private func actionBarButtonTapped(){
        print(#function)
    }
    // MARK: - setupUI elements
    private func setupCollectionView(){
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    private func setupNavigationBar(){
        let titleLabel = UILabel()
        titleLabel.text = "Photos"
        titleLabel.font = UIFont.systemFont(ofSize: 15,weight: .medium)
        titleLabel.textColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem,addBarButtonItem]
    }
    private func setupSearchBar(){
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    // MARK - UICOllectionViewDaraSourse , UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
    
    
}
