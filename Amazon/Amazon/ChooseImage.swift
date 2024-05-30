//
//  ChooseImage.swift
//  Amazon
//
//  Created by Victoria Samsonova on 30.05.24.
//

import Foundation
import UIKit

func chooseImage(from viewController: UIViewController, image: UIImageView) {
    let ac = UIAlertController(title: "Add image", message: "", preferredStyle: .actionSheet)
    let cameraButton = UIAlertAction(title: "Camera", style: .default, handler: { (_) in
        showImage(from: viewController, source: .camera, image: image)
    })
    let libraryButton = UIAlertAction(title: "Library", style: .default) { (_) in
        showImage(from: viewController, source: .photoLibrary, image: image)
    }
    let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    ac.addAction(cameraButton)
    ac.addAction(libraryButton)
    ac.addAction(cancelButton)
    viewController.present(ac, animated: true, completion: nil)
}


func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any], image: UIImageView) {
    if let selectedImage = info[.originalImage] as? UIImage {
        image.image = selectedImage
        print("okkkkkkk")
    }
    else {
        print("image not found")
    }
    picker.dismiss(animated: true, completion: nil)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
}

func showImage(from viewController: UIViewController, source: UIImagePickerController.SourceType, image: UIImageView) {
    guard UIImagePickerController.isSourceTypeAvailable(source) else {
        return
    }
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = viewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
    imagePickerController.sourceType = source
    imagePickerController.allowsEditing = false
    viewController.present(imagePickerController, animated: true, completion: nil)
}
