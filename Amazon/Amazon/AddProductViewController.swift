////
////  AddProductViewController.swift
////  Amazon
////
////  Created by Victoria Samsonova on 28.05.24.
////
//
//import UIKit
//
//class AddProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    @IBOutlet weak var scroll: UIScrollView!
//    @IBOutlet weak var myView: UIView!
//    
//    @IBOutlet weak var addProductButton: UIButton!
//    @IBOutlet weak var addNameTF: UITextField!
//    @IBOutlet weak var addCharTF: UITextField!
//    @IBOutlet weak var addPriceTF: UITextField!
//    @IBOutlet weak var productImageView: UIImageView!
//    @IBOutlet weak var addAmountTF: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        let contentHeight = myView.frame.size.height
//        scroll.contentSize = CGSize(width: scroll.frame.size.width, height: contentHeight)
//    }
//    
//    @IBAction func addImageTap(_ sender: Any) {
//        chooseImage(from: self, image: productImageView)
//    }
//    
//    @IBAction func addProductTap(_ sender: Any) {
//        let amount = addAmountTF.text
//        guard let imageName = productImageView.image?.accessibilityIdentifier else {
//            print("Image has no accessibility identifier")
//            return
//        }
//        addProduct(name: addNameTF.text, characteristics: addCharTF.text, price: addPriceTF.text, image: imageName, amount: Int(amount!))
//    }
//   
//    func addProduct(name: String?, characteristics: String?, price: String?, image: String?, amount: Int?) {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let newProduct = ProductItem(context: context)
//        newProduct.id = UUID()
//        newProduct.name = name
//        newProduct.prodDescription = characteristics
//        newProduct.price = price
//        newProduct.amount = Int16(amount ?? 0)
//        newProduct.image = image
//        do {
//            try context.save()
//        }
//        catch {
//            print("Error saving product: \(error)")
//        }
//    }
//}
//
