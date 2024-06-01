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
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var selectedProduct: NSDictionary?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let selectedProduct = selectedProduct else {
                print("selected product is nil")
                return
        }
        print("selected product: \(selectedProduct)")
        exactProductName.text = selectedProduct.object(forKey: "name") as? String
        exactProductDescription.text = selectedProduct.object(forKey: "description") as? String
        exactProductImage.image = UIImage(named: selectedProduct.object(forKey: "image") as! String)
        exactProductPrice.text = selectedProduct.object(forKey: "price") as? String
        addButton.tintColor = UIColor(#colorLiteral(red: 0.9963644147, green: 0.6345276237, blue: 0.115470238, alpha: 1))
    }
    

    @IBAction func stepperValueChanged(_ sender: Any) {
        amountLabel.text = String(Int(stepper.value))
        changePrice(label: exactProductPrice, value: stepper.value)
    }
    
    func changePrice(label: UILabel, value: Double) {
        if let priceText = selectedProduct?.object(forKey: "price") as? String, let priceInt = Int(priceText.dropLast()) {
            let newPrice = String(format: "$%.2f", Double(priceInt) * value)
            label.text = newPrice
        }
    }

    @IBAction func addToCartTap(_ sender: Any) {
        guard let image = exactProductImage.image else { return }
        let price = exactProductPrice.text ?? ""
        guard let name = exactProductName.text else { return }
        let amount = stepper.value
        addToCart(name: name, price: price, amount: Int(amount), image: image)
    }
    
    @IBAction func moveToCart(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
