//
//  KeyboardButtonLayout.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import UIKit

class KeyboardButtonLayout: UICollectionViewFlowLayout {
    
    private var itemCache: [UICollectionViewLayoutAttributes] = []
    
    
    override func prepare() {
        super.prepare()
        
        itemCache.removeAll()
        
        guard let collectionView = collectionView else { return }
        
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let cvWidth = collectionView.bounds.size.width
        let cvHeight = collectionView.bounds.size.height
        
        minimumLineSpacing = 18
        minimumInteritemSpacing = 18
        
        sectionInset.top = 18
        sectionInset.left = 25
        sectionInset.right = 25
        sectionInset.bottom = cvHeight / 10
        
        let itemsInColumn = 5
        let bottomTopInsets = sectionInset.top + sectionInset.bottom
        let columnInsets = minimumLineSpacing * CGFloat(itemsInColumn - 1) + bottomTopInsets
        let columnAvailableSpace = cvHeight - columnInsets
        let cellHeight = columnAvailableSpace / CGFloat(itemsInColumn)
        
        let itemsInRow = 4
        let sideInsets = sectionInset.left + sectionInset.right
        let rowInsets = minimumInteritemSpacing * CGFloat(itemsInRow - 1) + sideInsets
        let rowAvailableSpace = cvWidth - rowInsets
        let cellWidth = rowAvailableSpace / CGFloat(itemsInRow)

        var leftInset = sectionInset.left
        var topInset = sectionInset.top
        
        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)
            var frame = CGRect(x: leftInset, y: topInset, width: cellWidth, height: cellHeight)
            
            if item == 16 {
                frame.size.width *= 2
                frame.size.width += minimumInteritemSpacing
            }
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            
            leftInset = frame.maxX + minimumInteritemSpacing
            if (item + 1) % itemsInRow == 0 {
                leftInset = sectionInset.left
                topInset = frame.maxY + minimumLineSpacing
            }
            
            itemCache.append(attributes)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in itemCache {
            visibleLayoutAttributes.append(attributes)
        }
        
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        super.layoutAttributesForItem(at: indexPath)
        return itemCache[indexPath.item]
    }
}
