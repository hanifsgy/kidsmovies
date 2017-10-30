//
//  ViewController.swift
//  KidsMovies
//
//  Created by Hanif Sugiyanto on 10/26/17.
//  Copyright © 2017 extrainteger. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    // MARK: Properties
    fileprivate var cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        
        view.backgroundColor = UIColor.white
        
        setupView()
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        view.addSubview(collectionView)
        // safe area guides
        let margins = view.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func fetchData() {
        Alamofire.request(WebServices.urlGenre).validate().responseJSON { (respond) in
        }
        
        Alamofire.request(WebServices.urlGenre, method: .get, parameters: nil, encoding: JSONEncoding.default).validate().responseJSON { (respond) in
            print(respond)
        }
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.gray
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 16, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 0, 0, 0)
    }
    
}

