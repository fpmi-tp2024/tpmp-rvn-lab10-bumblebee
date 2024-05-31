//
//  ThankYouViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 31.05.24.
//

import UIKit

class ThankYouViewController: UIViewController {

    @IBOutlet weak var descrLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMainTap(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

