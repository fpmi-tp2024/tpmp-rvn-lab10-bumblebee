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
        guard let image = productImage.image else { return }
        let price = priceLabel.text ?? ""
        guard let name = nameLabel.text else { return }
        let amount = 1
        addToCart(name: name, price: price, amount: Int(amount), image: image)
    }
}
