//
//  LoginViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 27.05.24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginTap(_ sender: Any) {
        
    }
    
    @IBAction func SignUpTap(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
