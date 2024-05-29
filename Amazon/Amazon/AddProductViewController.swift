//
//  AddProductViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 28.05.24.
//

import UIKit

class AddProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBOutlet weak var addNameTF: UITextField!
    @IBOutlet weak var addCharTF: UITextField!
    @IBOutlet weak var addPriceTF: UITextField!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var addAmountTF: UITextField!
    
    @IBAction func addImageTap(_ sender: Any) {
        let ac = UIAlertController(title: "Add image", message: "", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "Camera", style: .default) {[weak self] (_) in
            self?.showImage(selectedSource: .camera)
        }
        let libraryButton = UIAlertAction(title: "Library", style: .default) {[weak self] (_) in
            self?.showImage(selectedSource: .photoLibrary)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        ac.addAction(cameraButton)
        ac.addAction(libraryButton)
        ac.addAction(cancelButton)
        self.present(ac, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            productImageView.image = selectedImage
        }
        else {
            print("image not found")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showImage(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func addProductToGalleryTap(_ sender: Any) {
        let amount = addAmountTF.text
        guard let imageName = productImageView.image?.accessibilityIdentifier else {
            print("Image has no accessibility identifier")
            return
        }
        addProduct(name: addNameTF.text, characteristics: addCharTF.text, price: addPriceTF.text, image: imageName, amount: Int(amount!))
    }
    
    func addProduct(name: String?, characteristics: String?, price: String?, image: String?, amount: Int?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newProduct = ProductItem(context: context)
        newProduct.id = UUID()
        newProduct.name = name
        newProduct.prodDescription = characteristics
        newProduct.price = price
        newProduct.amount = Int16(amount ?? 0)
        newProduct.image = image
        do {
            try context.save()
        }
        catch {
            print("Error saving product: \(error)")
        }
    }
}

