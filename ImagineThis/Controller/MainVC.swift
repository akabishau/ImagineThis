//
//  MainVC.swift
//  ImagineThis
//
//  Created by Aleksey on 1118..20.
//

import UIKit

class MainVC: UIViewController {

    // TODO: - Redo level buttons to collection view
    lazy var backgroundImageView = BGImageView(frame: view.bounds)
    let buttonsStackView = UIStackView()
    let easyLevelButton = LevelButton(level: .easy)
    let normalLevelButton = LevelButton(level: .normal)
    let hardLevelButton = LevelButton(level: .hard)
    let categoryTitleView = UIImageView(frame: .zero)
    let startButton = StartButton()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        //TODO: - get rid off hardcoded value
        pageControl.numberOfPages = 4
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let categories = Category.allCases
    let levels = Level.allCases
    
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
        view.addSubview(categoryTitleView)
        view.addSubview(pageControl)
        view.addSubview(startButton)
        
        categoryTitleView.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            categoryTitleView.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            categoryTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryTitleView.heightAnchor.constraint(equalToConstant: 40),
            categoryTitleView.widthAnchor.constraint(equalToConstant: 150),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding * 3),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding * 3),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding * 2),
            startButton.heightAnchor.constraint(equalToConstant: 80),
            
            pageControl.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -20),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
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
    
    
    //TODO: - fix ability to double click the button
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
        cardVC.category = getCategory()
        cardVC.level = getLevel()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //TODO: - confirm with the client removing navigation animation
            self.navigationController?.pushViewController(cardVC, animated: false)
        }
    }
    
    
    private func getLevel() -> Level? {
        let levelButtons = buttonsStackView.arrangedSubviews as! [UIButton]
        let selectedLevelButtonIndex = levelButtons.firstIndex { $0.isSelected }
        return levels[selectedLevelButtonIndex!]
    }
    
    
    private func getCategory() -> Category? {
        guard let visibleCategoryIndexPath = collectionView.indexPathsForVisibleItems.first else {
            print("can't get category index path")
            return nil
        }
        return categories[visibleCategoryIndexPath.item]
    }

    
    private func addActionToStartButton() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIndentifier)
        //collectionView.delegate = self
        configureDataSource()
    }
    
    
    private func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        section.visibleItemsInvalidationHandler = { [weak self] _, scrollOffset, _ in
            guard let self = self else { return }
            let size = Float(self.collectionView.contentSize.width)
            let offset = Float(scrollOffset.x)
            if size > 0 && offset >= 0 {
                // TODO: - when scrolling backwards the title and page control are updated too soon
                // check the floorf function mechanics
                let currentPage = Int(floorf(offset / size))
                self.pageControl.currentPage = currentPage
                self.categoryTitleView.image = self.categories[currentPage].titleImage
            } else {
                self.pageControl.currentPage = 0
                self.categoryTitleView.image = self.categories[0].titleImage
            }
        }
        
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
