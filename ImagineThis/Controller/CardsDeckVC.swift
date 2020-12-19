//
//  CardsDeckVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1212..20.
//

import UIKit

class CardsDeckVC: UIViewController {
    
    var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        configureCollectionView()
    }
    
    
    private func configureCollectionView() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()) // view.bound - why it is not working?
        print(collectionView.frame.height)
        view.addSubview(collectionView)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIndentifier)
        
        collectionView.backgroundColor = .systemGray
        collectionView.fillSuperView(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
}
