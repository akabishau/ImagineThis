//
//  MainVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1118..20.
//

import UIKit

class MainVC: UIViewController {

    lazy var backgroundImageView = BGImageView(frame: view.bounds)
    let buttonsStackView = UIStackView()
    let easyLevelButton = LevelButton(level: .easy)
    let normalLevelButton = LevelButton(level: .normal)
    let hardLevelButton = LevelButton(level: .hard)
    let startButton = StartButton()
    
    let categories = Category.allCases
    
    enum Section { case main }
    
    var collectionView: UICollectionView!
    var datasource: UICollectionViewDiffableDataSource<Section, Category>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureButtonsStackView()
        configureCollectionView()
        layoutUI()
        addActionToStartButton()
    }
    
    
    private func layoutUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(buttonsStackView)
        view.addSubview(collectionView)
        view.addSubview(startButton)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding * 4),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 44),
            
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding * 3),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding * 3),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding * 2),
            startButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    private func configureViewController() { }
    
    
    private func configureButtonsStackView() {
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        buttonsStackView.addArrangedSubview(easyLevelButton)
        buttonsStackView.addArrangedSubview(normalLevelButton)
        buttonsStackView.addArrangedSubview(hardLevelButton)
        
        easyLevelButton.isSelected = true
        
        easyLevelButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
        normalLevelButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
        hardLevelButton.addTarget(self, action: #selector(selectLevel), for: .touchUpInside)
        
    }
    
    
    @objc private func selectLevel(sender: UIButton) {
        let buttons = buttonsStackView.arrangedSubviews as! [UIButton]
        buttons.forEach { $0.isSelected = false }
        sender.isSelected = true
    }
    
    
    @objc private func startButtonTapped(_ sender: UIButton) {
        if let button = sender as? StartButton {
            button.pulsate()
        }
        
        let cardVC = CardsVC()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.navigationController?.pushViewController(cardVC, animated: true)
        }
    }

    
    private func addActionToStartButton() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIndentifier)
        
        configureDataSource()
    }
    
    
    private func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    private func configureDataSource() {
        
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, category) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIndentifier, for: indexPath) as? CategoryCell else {
                fatalError("Can't create new cell")
            }
            cell.imageView.image = category.image
            return cell
        })
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Category>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(categories, toSection: .main)
        
        datasource.apply(initialSnapshot, animatingDifferences: false, completion: nil)
    }
}

