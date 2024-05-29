//
//  ProfileViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 28.05.24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarProfile: UIImageView!
    @IBOutlet weak var usernameProfile: UILabel!
    @IBOutlet weak var emailProfile: UILabel!
    @IBOutlet weak var idProfile: UILabel!
    @IBOutlet weak var statusProfile: UILabel!
    @IBOutlet weak var birthdayProfile: UILabel!
    @IBOutlet weak var adressProfile: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarProfile.layer.cornerRadius = avatarProfile.frame.size.width / 2
        avatarProfile.layer.borderWidth = 2.0
        avatarProfile.layer.borderColor = UIColor.gray.cgColor
        usernameProfile.text = userDictionary["username"] as? String
        emailProfile.text = userDictionary["email"] as? String
        idProfile.text = String(describing: userDictionary["id"] as? Int16)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let birthday = userDictionary["birthday"] as? Date {
            birthdayProfile.text = dateFormatter.string(from: birthday)
        } else {
            birthdayProfile.text = ""
        }
        
        if let address =  userDictionary["address"] as? String {
            adressProfile.text = address
        }
        else {
            adressProfile.text = " – "
        }
        
        if let status = userDictionary["status"] as? Int, status == 0 {
            statusProfile.text = "Customer"
        } else {
            statusProfile.text = "Vendor"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editTap(_ sender: Any) {
        
    }
    
    @IBAction func leaveTap(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to leave your account?", preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "Sure", style: .default) {
            (_) in 
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(OkAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteTap(_ sender: Any) {
    }
}
