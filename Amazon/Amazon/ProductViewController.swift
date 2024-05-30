//
//  ProductViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var exactProductImage: UIImageView!
    @IBOutlet weak var exactProductName: UILabel!
    @IBOutlet weak var exactProductDescription: UILabel!
    @IBOutlet weak var exactProductPrice: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var selectedProduct: NSDictionary?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let selectedProduct = selectedProduct else {
                print("selected product is nil")
                return
        }
        print("selected monument: \(selectedProduct)")
        exactProductName.text = selectedProduct.object(forKey: "name") as? String
        //exactProductDescription.text = selectedProduct.object(forKey: "description") as? String
        exactProductImage.image = UIImage(named: selectedProduct.object(forKey: "image") as! String)
        exactProductPrice.text = selectedProduct.object(forKey: "price") as? String
        addButton.tintColor = UIColor(#colorLiteral(red: 0.9963644147, green: 0.6345276237, blue: 0.115470238, alpha: 1))
    }

    @IBAction func addToCartTap(_ sender: Any) {
    }
    
}
