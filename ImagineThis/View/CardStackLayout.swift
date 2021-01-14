//
//  CardStackLayout.swift
//  ImagineThis
//
//  Created by Aleksey on 0113..21.
//

import UIKit

protocol CardStackLayoutDelegate: class {
    //func cardShouldRemove(_ flowLayout: CardStackLayout, indexPath: IndexPath)
    func cardShouldRemove(_ flowLayout: CardStackLayout, cell: UICollectionViewCell)
}

class CardStackLayout: UICollectionViewLayout {
    
    weak var delegate: CardStackLayoutDelegate?

    private let maxOffsetThreshold: CGFloat = 0.3
    private let animationDuration: TimeInterval = 0.15
    typealias CellWithIndexPath = (cell: UICollectionView, indexPath: IndexPath)
    // topCellWithIndexPath: CellWithIndexPath { }
    // bottomCellWithIndexPath: CellWithIndexPath { }
    
    private var panGestureRecognizer = UIPanGestureRecognizer()
    
    override func prepare() {
        super.prepare()
        print(#function)
        panGestureRecognizer.addTarget(self, action: #selector(handlePan(gestureRecongnizer:)))
        collectionView?.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handlePan(gestureRecongnizer: UIPanGestureRecognizer) {
        let translation = gestureRecongnizer.translation(in: collectionView)
        
        let xOffset = translation.x
        let xMaxOffset = (collectionView?.frame.width ?? 0) * maxOffsetThreshold
        
        switch gestureRecongnizer.state {
        case .changed:
            print(xOffset)
            if let topCard = collectionView?.cellForItem(at: .init(item: 2, section: 0)) {
                topCard.transform = CGAffineTransform(translationX: xOffset, y: 0)
            }
            if let nextCard = collectionView?.cellForItem(at: .init(item: 1, section: 0)) {
                nextCard.alpha = 1
            }
        case .ended:
            print("ended")
            if abs(xOffset) > xMaxOffset {
                if let topCard = collectionView?.cellForItem(at: .init(item: 2, section: 0)) {
                    // animate and remove
                    animateAndRemove(left: xOffset < 0, cell: topCard, completion: { [weak self] in
                        guard let self = self else { return }
                        self.delegate?.cardShouldRemove(self, cell: topCard)
                    })
                }
                if let nextCard = collectionView?.cellForItem(at: .init(item: 1, section: 0)) {
                    // animate into top card position
                    animateIntoPosition(cell: nextCard)
                }
            } else {
                if let topCard = collectionView?.cellForItem(at: .init(item: 2, section: 0)) {
                    // animate back to a primary position
                    animateIntoPosition(cell: topCard)
                }
            }
            
        default:
            print("other gesture")
            break
        }
    }
    
    
    private func animateIntoPosition(cell: UICollectionViewCell) {
        UIView.animate(withDuration: animationDuration) {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }
    }
    
    
    private func animateAndRemove(left: Bool, cell: UICollectionViewCell, completion: (() -> ())?) {
        
        let screenWidth = UIScreen.main.bounds.width
        
        UIView.animate(withDuration: animationDuration) {
            let xTranslateOffscreen = CGAffineTransform(translationX: left ? -screenWidth : screenWidth, y: 0)
            cell.transform = xTranslateOffscreen
        } completion: { (completed) in
            completion?()
            print("need to update the data source")
        }

        
    }
    
    
    // helper function to get all index paths from rect
    private func indexPathsForElementsInRect(_ rect: CGRect) -> [IndexPath] {
        
        var indexPaths: [IndexPath] = []
        
        if let numberOfItems = collectionView?.numberOfItems(inSection: 0), numberOfItems > 0 {
            for i in 0...(numberOfItems - 1) {
                indexPaths.append(IndexPath(item: i, section: 0))
            }
        }
        
        return indexPaths
    }

    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        // all cells have the same frame as collection view
        attributes.frame = collectionView?.bounds ?? .zero
        
        // make the only top cell have alpha = 1 and 0 for others
        var isNotTop = false
        if let numItems = collectionView?.numberOfItems(inSection: 0), numItems > 0 {
            isNotTop = indexPath.row != numItems - 1
        }
        attributes.alpha = isNotTop ? 0 : 1
        
        return attributes
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //get all index paths for all the cells
        // loop through them and apply layout attributes for each item
        // return array of modified layout attributes
        
        let indexPaths = indexPathsForElementsInRect(rect)
        let layoutAttributes = indexPaths.map { layoutAttributesForItem(at: $0) }
            .filter { $0 != nil }.map { $0! }
        return layoutAttributes
    }
}
