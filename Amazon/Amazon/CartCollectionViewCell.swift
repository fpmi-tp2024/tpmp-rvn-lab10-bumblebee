//
//  CartCollectionViewCell.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    
    var indexPath: IndexPath?
    var product: exactProd?
    var productsCollection: UICollectionView?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func deleteButtonTap(_ sender: Any) {
        if let indexPath = self.indexPath {
            deleteItemFromCollectionView(at: indexPath, in: productsCollection!)
            print("deleted")
        }
    }
    
    func deleteItemFromCollectionView(at indexPath: IndexPath, in collectionView: UICollectionView) {
        cart.remove(at: indexPath.item)
        collectionView.performBatchUpdates({
            collectionView.deleteItems(at: [indexPath])
        }, completion: nil)
    }
}
