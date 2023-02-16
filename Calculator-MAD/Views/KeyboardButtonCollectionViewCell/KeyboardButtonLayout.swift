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
//        print(collectionView.frame.height)
        
        var size = min((collectionView.frame.height - 18 - 25 - 15 * 4) / 5, (collectionView.frame.width - 50 - 15 * 3) / 4)
//        size = (collectionView.frame.width - 40) / 5
        print(size)

//        let sp = min(minimumInteritemSpacing, minimumLineSpacing)
//        minimumLineSpacing = sp
//        minimumInteritemSpacing = sp
//
//        sectionInset.top = 18
//        sectionInset.left = 20
//        sectionInset.right = 20
//        sectionInset.bottom = 13
        
        itemSize = CGSize(width: (collectionView.frame.width - 50 - 18 * 3) / 4, height: (collectionView.frame.height - 18 - sectionInset.bottom - 18 * 4) / 5)
//sectionInset.bottom = 25
//        let itemsInColumn = 5
//        let sideInsets2 = sectionInset.top + sectionInset.bottom
//        let columnInsets = minimumLineSpacing * CGFloat(itemsInColumn - 1) + sideInsets2
//        let avaliableSpace2 = collectionView.frame.height - columnInsets
//        let cellSize = avaliableSpace2 / CGFloat(itemsInColumn)
////        itemSize = CGSize(width: cellSize + 10, height: cellSize)
//
////        itemSize = CGSize(width: collectionView.frame.height / 5, height: collectionView.frame.height / 5)
//
//        let itemsInRow = 4
//        let sideInsets = sectionInset.left * 2
//        let lineInsets = minimumInteritemSpacing * CGFloat(itemsInRow - 1) + sideInsets
//        let avaliableSpace = collectionView.frame.width - lineInsets
//        let cellWidth = avaliableSpace / CGFloat(itemsInRow)
////        itemSize = CGSize(width: cellWidth, height: cellWidth)
//
//        let size = min(cellSize, cellWidth)
//
//        itemSize = CGSize(width: size, height: size)
    }
}
