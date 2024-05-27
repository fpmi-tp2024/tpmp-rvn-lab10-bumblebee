//
//  SignUpViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 27.05.24.
//

import UIKit

class SignUpViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.tintColor = UIColor(#colorLiteral(red: 0.9963644147, green: 0.6345276237, blue: 0.115470238, alpha: 1))
        resetForm()
    }
    
    @IBOutlet weak var incEmail: UILabel!
    @IBOutlet weak var incPassword: UILabel!
    @IBOutlet weak var mismatchPasswords: UILabel!
    
    @IBOutlet weak var statusSwitch: UISegmentedControl!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var secondPasswordTF: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    @IBAction func emailEntering(_ sender: Any) {
        let email = emailTF.text
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailPredicate.evaluate(with: email) {
            incEmail.isHidden = false
        }
        else {
            incEmail.isHidden = true
        }
        if email == "" {
            incEmail.isHidden = true
        }
    }
    
    @IBAction func passwordEntering(_ sender: Any) {
        let password = passwordTF.text
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).+$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        if !passwordPredicate.evaluate(with: password) {
            incPassword.isHidden = false
            secondPasswordTF.isEnabled = false
        }
        else {
            incPassword.isHidden = true
            secondPasswordTF.isEnabled = true
        }
        if password == "" {
            incPassword.isHidden = true
            secondPasswordTF.text = ""
        }
    }
    
    @IBAction func secondPasswordEntering(_ sender: Any) {
        let secondPassword = secondPasswordTF.text
        if passwordTF.text != secondPassword {
            mismatchPasswords.isHidden = false
        }
        else {
            mismatchPasswords.isHidden = true
        }
        if secondPassword == "" {
            mismatchPasswords.text = ""
            //passwordTF.text = ""
        }
    }

    @IBAction func termsTap(_ sender: Any) {
        performSegue(withIdentifier: "privacy", sender: self)
    }
    
    @IBAction func createTap(_ sender: Any) {
        if (usernameTF.text == "" || emailTF.text == "" || secondPasswordTF.text == "") {
            let alert = UIAlertController(title: "Impossible", message: "You should paste all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        addUserData(status: statusSwitch.selectedSegmentIndex, userName: usernameTF.text, email: emailTF.text, password: passwordTF.text, birthday: date.date)
        self.navigationController?.popViewController(animated: true)
    }
    

    func resetForm() {
        incEmail.isHidden = true
        incPassword.isHidden = true
        mismatchPasswords.isHidden = true
    }
    
}