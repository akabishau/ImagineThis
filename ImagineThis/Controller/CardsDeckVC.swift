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
        
        if let layout = collectionView.collectionViewLayout as? CardStackLayout {
            layout.delegate = self
        }
    }
    
    
    private func configureCollectionView() {
        
        let layout = CardStackLayout()
        //layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) // view.bound - why it is not working?
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIndentifier)
        
        collectionView.backgroundColor = .systemGray
        collectionView.fillSuperView(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension CardsDeckVC: UICollectionViewDataSource {
    
    
    // TODO: Replace the hardcoded value
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseIndentifier, for: indexPath) as? CardCell else { fatalError("Can't create new cell") }
        cell.set(sentence: "Some Text to Show. And very very long phrase!")
        return cell
    }
}


extension CardsDeckVC: UICollectionViewDelegate {
    
}


extension CardsDeckVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size
        let cellSize = CGSize(width: collectionViewSize.width * 0.9, height: collectionViewSize.height * 0.9)
        return cellSize
    }
    
}


extension CardsDeckVC: CardStackLayoutDelegate {
    func cardShouldRemove(_ flowLayout: CardStackLayout, cell: UICollectionViewCell) {
        print(#function)
        //cardsData.removeLast()
        //cardsData.insertNewCard()
        collectionView.reloadData()
    }
}
