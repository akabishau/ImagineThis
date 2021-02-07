//
//  CardsDeckVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1212..20.
//

import UIKit

class CardsDeckVC: UIViewController {
    
    
    enum Section { case main }
    var count = 3
    var sentences = ["3", "2", "1"]
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        updateData()
    }
    
    
    private func configureCollectionView() {
        print(#function)
        let layout = CardStackLayout()
        layout.delegate = self
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIndentifier)
        
        collectionView.backgroundColor = .clear
        collectionView.fillSuperView()
        
    }
     
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, sentence) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseIndentifier, for: indexPath) as? CardCell else { fatalError("Can't create new cell") }
            cell.set(sentence: sentence)
            return cell
        })
    }
    
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(sentences, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
    
}


extension CardsDeckVC: CardStackLayoutDelegate {
    func cardShouldRemove(_ flowLayout: CardStackLayout, cell: UICollectionViewCell) {
        print(#function)
        sentences.removeLast()
        count += 1
        sentences.insert(String(count), at: 0)
        updateData()
    }
}
