//
//  PapersFlowLayout.swift
//  Papers
//
//  Created by Tim Mitra on 1/15/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class PapersFlowLayout: UICollectionViewFlowLayout {
    
    var appearingIndexPath: NSIndexPath?
    var disappearingItemsIndexPaths: [NSIndexPath]?
    
    
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        guard let attributes = super.initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath),
            indexPath = appearingIndexPath where indexPath == itemIndexPath  else {
                return nil
        }
        
        attributes.alpha = 1.0
        attributes.center = CGPoint(x: CGRectGetWidth(collectionView!.frame) - 23.5, y: -24.5)
        attributes.transform = CGAffineTransformMakeScale(0.15, 0.15)
        attributes.zIndex = 99
        
        return attributes
    }
    override func finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath),
            indexPaths = disappearingItemsIndexPaths where indexPaths.contains(itemIndexPath) else {
                return nil
        }
        attributes.alpha = 1.0
        attributes.transform = CGAffineTransformMakeScale(0.1, 0.1)
        attributes.zIndex = -1
        return attributes
    }
}