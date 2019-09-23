//
//  PhotosCollectionViewController.swift
//  swiftbook1
//
//  Created by Admin on 04/09/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//


import UIKit
 
class PhotosCollectionViewController: UICollectionViewController {
    
    var networkDataFetcher = NetworkDataFetcher()
    private var timer: Timer?
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .orange
        setupCollectionView()
        setupNavBar()
        setupSearchBar()
    }
    //MARK: - NavigationItems actions
    @objc private func addBarButtonTapped(){
        print(#function)
    }
    @objc private func actionBarButtonTapped(){
        print(#function)
    }
    
    // MARK: - SetupUIelements
    private func setupCollectionView(){
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    private func setupSearchBar(){
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        // скрывает и затемняет кнопки в нав баре при значении true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func setupNavBar(){
        let titilelabel = UILabel()
        titilelabel.text = "Photos"
        titilelabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titilelabel.textColor = .blue
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titilelabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem,addBarButtonItem]
    }
    
    // MARK: - UICollectionViewDataSorce, UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
              cell.backgroundColor = .red
              return cell
    }
}
   // MARK: - UISearchBar Delegate
extension PhotosCollectionViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
//        networkService.request(searchTerm: searchText) { (_, _) in
//            print("123")
//        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkDataFetcher.getImages(searchTerm: searchText) { (searchResults) in
                       searchResults?.results.map({ (photo) in
                           print(photo.urls["small"])
                       })
                   }
        })
       
    }
}
