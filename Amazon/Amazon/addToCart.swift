//
//  addToCart.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import Foundation
import UIKit

struct exactProd {
    var exactName: String
    var exactPrice: String
    var exactAmount: Int
    var exactImage: UIImage
}

var cart: [exactProd] = []

func addToCart(name: String, price: String, amount: Int, image: UIImage) {
    let oneProduct = exactProd(exactName: name, exactPrice: price, exactAmount: amount, exactImage: image)
    cart.append(oneProduct)
}

