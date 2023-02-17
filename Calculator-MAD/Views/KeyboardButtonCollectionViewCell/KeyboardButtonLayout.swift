//
//  KeyboardButtonLayout.swift
//  Calculator-MAD
//
//  Created by Ivan Semenov on 16.02.2023.
//

import UIKit

class KeyboardButtonLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        minimumLineSpacing = 18
        minimumInteritemSpacing = 18
        
        sectionInset.top = 18
        sectionInset.left = 25
        sectionInset.right = 25
        sectionInset.bottom = collectionView.frame.height / 10
        
        let itemsInColumn = 5
        let bottomTopInsets = sectionInset.top + sectionInset.bottom
        let columnInsets = minimumLineSpacing * CGFloat(itemsInColumn - 1) + bottomTopInsets
        let columnAvailableSpace = collectionView.frame.height - columnInsets
        let cellHeight = columnAvailableSpace / CGFloat(itemsInColumn)
        
        let itemsInRow = 4
        let sideInsets = sectionInset.left + sectionInset.right
        let rowInsets = minimumInteritemSpacing * CGFloat(itemsInRow - 1) + sideInsets
        let rowAvailableSpace = collectionView.frame.width - rowInsets
        let cellWidth = rowAvailableSpace / 4
        
        
        itemSize = CGSize(width: cellWidth, height: cellHeight)
    }
}
