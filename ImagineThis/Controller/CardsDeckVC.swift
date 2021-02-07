//
//  CardsDeckVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1212..20.
//

import UIKit

class CardsDeckVC: UIViewController {
    
    var sentenceManager: SentenceManager!
    
    init(sentenceManager: SentenceManager) {
        super.init(nibName: nil, bundle: nil)
        self.sentenceManager = sentenceManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Section { case main }
    var sentences: [String] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (0...2).forEach { _ in generateSentence() }
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
    
    
    private func generateSentence() {
        sentences.insert(sentenceManager.generateSentance(for: sentenceManager.category, level: sentenceManager.level), at: 0)
    }
    
}


extension CardsDeckVC: CardStackLayoutDelegate {
    func cardShouldRemove(_ flowLayout: CardStackLayout, cell: UICollectionViewCell) {
        print(#function)
        sentences.removeLast()
        generateSentence()
        print(sentences)
        updateData()
    }
}
