//
//  CartViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartView: UICollectionView!

    @IBOutlet weak var costLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartView.dataSource = self
        cartView.delegate = self
        cartView.collectionViewLayout = UICollectionViewFlowLayout()
        // Do any additional setup after loading the view.
    }

    @IBAction func orderButtonTap(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "Want to order? All user info is located in your profile. So only thing you need is to confirm purchase", preferredStyle: .alert)
        let CancelAction = UIAlertAction(title: "Cancel", style: .default) {
            (_) in
            self.dismiss(animated: true, completion: nil)
        }
        let OkAction = UIAlertAction(title: "Confirm", style: .default) {
            (_) in let thankYouVC = self.storyboard?.instantiateViewController(identifier: "ThankYouViewController") as! ThankYouViewController
            self.navigationController?.pushViewController(thankYouVC, animated: true)
        }
        alert.addAction(CancelAction)
        alert.addAction(OkAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cart.count
    }
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 361, height: 124)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
        let productInCartInfo = cart[indexPath.item]
        cell.imageView.image = productInCartInfo.exactImage
        cell.nameLabel.text = productInCartInfo.exactName
        cell.priceLabel.text = productInCartInfo.exactPrice
        cell.indexPath = indexPath
        cell.productsCollection = collectionView
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.cornerRadius = 10
        print("added")
        return cell
    }
}


