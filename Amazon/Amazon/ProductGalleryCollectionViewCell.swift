//
//  ProductGalleryCollectionViewCell.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit

class ProductGalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!

    @IBAction func addToCartTap(_ sender: Any) {
        if let image = productImage.image {
            addToCart(name: nameLabel.text ?? "", price: priceLabel.text ?? "", amount: 1, image: image)
        }
        print("tapped")
    }
}
