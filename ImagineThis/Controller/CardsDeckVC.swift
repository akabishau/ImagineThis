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
        configureCollectionView()
    }
    
    
    private func configureCollectionView() {
        
        let layout = CardStackLayout()
        layout.delegate = self
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIndentifier)
        
        collectionView.backgroundColor = .clear
        collectionView.fillSuperView()
        
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
        cell.set(sentence: "Some Text to Show. And very very long phrase! Yes very-very long freaking set of word about something really stupid...")
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
