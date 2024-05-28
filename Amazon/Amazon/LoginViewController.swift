//
//  LoginViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 27.05.24.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var foundUser = [NSManagedObject]();
    
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
            let alert = UIAlertController(title: "Denied", message: "Don't have such user", preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "Sign up", style: .default) {
                (_) in 
                let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
                self.navigationController?.pushViewController(signUpVC, animated: true)
            }
            alert.addAction(OkAction)
        }
        else {
            
        }
    }
    
    @IBAction func SignUpTap(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
