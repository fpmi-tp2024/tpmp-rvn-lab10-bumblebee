//
//  GalleryViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit

class GalleryViewController: UIViewController {
    
    var InfoList = NSDictionary();
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "Products", ofType: "plist")
        InfoList = NSDictionary(contentsOfFile: path!)!
                    
        productsCollection.dataSource = self
        productsCollection.delegate = self
        productsCollection.collectionViewLayout = UICollectionViewFlowLayout()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let productViewController = segue.destination as? ProductViewController,
        let indexPath = productsCollection.indexPathsForSelectedItems?.first {
        let productInfo = InfoList.object(forKey: ((InfoList.allKeys) [indexPath.item])) as! NSDictionary
        productViewController.selectedProduct = productInfo
        }
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return InfoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGalleryCollectionViewCell", for: indexPath) as! ProductGalleryCollectionViewCell
        let productInfo = (InfoList.object(forKey: ((InfoList.allKeys) [indexPath.row]))) as! NSDictionary
        cell.productImage.image = UIImage(named: productInfo.object(forKey: "image") as! String)
        cell.nameLabel.text = productInfo.object(forKey: "name") as? String
        cell.priceLabel.text = productInfo.object(forKey: "price") as? String
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.cornerRadius = 10
        print("okkk")
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 224)
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let productInfo = InfoList.object(forKey: ((InfoList.allKeys) [indexPath.item])) as? NSDictionary {
            let productViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
            productViewController.selectedProduct = productInfo
            navigationController?.pushViewController(productViewController, animated: true)
        }
        print("InfoList: \(InfoList)")
    }
}
