//
//  LoginViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 27.05.24.
//

import UIKit
import CoreData

var userDictionary = [String: Any]()

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //var foundUser = [NSManagedObject]();
    var foundUser = [User]()
    
    @IBOutlet weak var UsernameLogTF: UITextField!
    @IBOutlet weak var PasswordlogTF: UITextField!
    @IBOutlet weak var IDLogTF: UITextField!
    
    @IBAction func LoginTap(_ sender: Any) {
        let idValue = Int16(IDLogTF.text!)!
        let searchRequest = NSFetchRequest<User>(entityName: "User")
        searchRequest.predicate = NSPredicate(format: "username == %@ && password == %@ && id = %ld", UsernameLogTF.text!, PasswordlogTF.text!, idValue)
        try!
        foundUser = appDelegate.persistentContainer.viewContext.fetch(searchRequest)
        if foundUser.isEmpty {
            print("empty")
            let alert = UIAlertController(title: "Denied", message: "Don't have such user", preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "Sign up", style: .default) {
                (_) in 
                let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
                self.navigationController?.pushViewController(signUpVC, animated: true)
            }
            alert.addAction(OkAction)
        }
        else {
            print("non empty")
            let user = foundUser[0]
            userDictionary["username"] = user.username
            userDictionary["email"] = user.email
            userDictionary["status"] = user.status
            userDictionary["birthday"] = user.birthday
            userDictionary["address"] = user.address
            userDictionary["id"] = user.id
            if 1...1000 ~= Int16(IDLogTF.text!) ?? 0 {
                let customerView = self.storyboard?.instantiateViewController(withIdentifier: "CustomerController") as! CustomerController
                self.navigationController?.pushViewController(customerView, animated: true)
            }
            else {
                let vendorView = self.storyboard?.instantiateViewController(withIdentifier: "VendorController") as! VendorController
                self.navigationController?.pushViewController(vendorView, animated: true)
            }
            UsernameLogTF.text = ""
            UsernameLogTF.tintColor = .clear
            PasswordlogTF.text = ""
            PasswordlogTF.tintColor = .clear
            IDLogTF.text = ""
            IDLogTF.tintColor = .clear
        }
    }
    
    @IBAction func SignUpTap(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    
}
