//
//  ProfileViewController.swift
//  Amazon
//
//  Created by Victoria Samsonova on 28.05.24.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var avatarProfile: UIImageView!
    @IBOutlet weak var usernameProfile: UILabel!
    @IBOutlet weak var emailProfile: UILabel!
    @IBOutlet weak var idProfile: UILabel!
    @IBOutlet weak var statusProfile: UILabel!
    @IBOutlet weak var birthdayProfile: UILabel!
    @IBOutlet weak var adressProfile: UILabel!
    
    @IBOutlet weak var editUsernameTF: UITextField!
    @IBOutlet weak var editEmailTF: UITextField!
    @IBOutlet weak var editAddressTF: UITextField!
    @IBOutlet weak var editPasswordTF: UITextField!
    
    @IBOutlet weak var leaveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var cantLabel: UILabel!
    @IBOutlet weak var cant2Label: UILabel!
    @IBOutlet weak var newBirthday: UIDatePicker!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var saveTest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarProfile.layer.cornerRadius = avatarProfile.frame.size.width / 2
        avatarProfile.layer.borderWidth = 2.0
        avatarProfile.layer.borderColor = UIColor.gray.cgColor
        usernameProfile.text = userDictionary["username"] as? String
        emailProfile.text = userDictionary["email"] as? String
        
        if let id =  userDictionary["id"] as? Int16 {
            idProfile.text = String(id)
        }
        else {
            idProfile.text = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let birthday = userDictionary["birthday"] as? Date {
            birthdayProfile.text = dateFormatter.string(from: birthday)
        } else {
            birthdayProfile.text = ""
        }
        
        if let address = userDictionary["address"] as? String {
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
        saveTest.isHidden = true
        needToTapEdit()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editTapped(_ sender: Any) {
        saveTest.isHidden = false
        editProfileButton.isHidden = true
        needToTapSave()
    }
    
    func needToTapSave() {
        usernameProfile.isHidden = true
        emailProfile.isHidden = true
        birthdayProfile.isHidden = true
        adressProfile.isHidden = true
        editUsernameTF.isHidden = false
        editEmailTF.isHidden = false
        newBirthday.isHidden = false
        editAddressTF.isHidden = false
        editPasswordTF.isHidden = false
        cantLabel.isHidden = false
        cant2Label.isHidden = false
        leaveButton.isHidden = false
        deleteButton.isHidden = false
        editPhotoButton.isHidden = false
        passwordLabel.isHidden = false
        editUsernameTF.text = usernameProfile.text
        editEmailTF.text = emailProfile.text
        editAddressTF.text = adressProfile.text
        idProfile.textColor = UIColor(#colorLiteral(red: 0.7777124047, green: 0.7926474214, blue: 0.8138783574, alpha: 1))
        statusProfile.textColor = UIColor(#colorLiteral(red: 0.7777124047, green: 0.7926474214, blue: 0.8138783574, alpha: 1))
    }
    
    func needToTapEdit() {
        usernameProfile.isHidden = false
        emailProfile.isHidden = false
        birthdayProfile.isHidden = false
        adressProfile.isHidden = false
        editUsernameTF.isHidden = true
        editEmailTF.isHidden = true
        newBirthday.isHidden = true
        editAddressTF.isHidden = true
        editPasswordTF.isHidden = true
        cantLabel.isHidden = true
        cant2Label.isHidden = true
        leaveButton.isHidden = true
        deleteButton.isHidden = true
        editPhotoButton.isHidden = true
        passwordLabel.isHidden = true
        idProfile.textColor = UIColor.black
        statusProfile.textColor = UIColor.black
    }
    
    func rewriteValues(id: Int16, newUsername: String?, newUsernameLabel: UILabel, newEmail: String?, newEmailLabel: UILabel, newBirthday: Date?, newBirthdayLabel: UILabel, newAddress: String?, newAddressLabel: UILabel, newPassword: String?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let users = try context.fetch(fetchRequest)
            let user = users.first
            user?.username = newUsername
            user?.email = newEmail
            user?.birthday = newBirthday
            user?.address = newAddress
            user?.password = newPassword
            do {
                try context.save()
                newUsernameLabel.text = newUsername
                newEmailLabel.text = newEmail
                newAddressLabel.text = newAddress
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                if let newBirthday = newBirthday {
                    let birthdayString = dateFormatter.string(from: newBirthday)
                    newBirthdayLabel.text = birthdayString
                } else {
                    newBirthdayLabel.text = ""
                }
                print("updated")
            }
            catch {
                print("didn't update user data: \(error)")
            }
        }
        catch {
            print("didn't fetch user: \(error)")
        }
    }
    
    @IBAction func editPhotoTap(_ sender: Any) {
        chooseImage(from: self, image: avatarProfile)
    }
    
    
    @IBAction func leaveTap(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to leave your account?", preferredStyle: .alert)
        let NoAction = UIAlertAction(title: "Cancel", style: .default) {
            (_) in
            self.dismiss(animated: true, completion: nil)
        }
        let OkAction = UIAlertAction(title: "Sure", style: .default) {
            (_) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(NoAction)
        alert.addAction(OkAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func deleteTap(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
        let NoAction = UIAlertAction(title: "Cancel", style: .default) {
            (_) in
            self.dismiss(animated: true, completion: nil)
        }
        let OkAction = UIAlertAction(title: "Sure", style: .default) {
            (_) in
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
               let id = Int16(self.idProfile.text!),
               let user = self.fetchUser(withId: id, in: appDelegate.persistentContainer.viewContext) {
                appDelegate.persistentContainer.viewContext.delete(user)
                do {
                    try appDelegate.persistentContainer.viewContext.save()
                    self.navigationController?.popViewController(animated: true)
                } catch {
                    print("didn't delete user: \(error)")
                }
            }
        }
        alert.addAction(NoAction)
        alert.addAction(OkAction)
        self.present(alert, animated: true, completion: nil)
    }

    func fetchUser(withId id: Int16, in context: NSManagedObjectContext) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let users = try context.fetch(fetchRequest)
            return users.first
        } catch {
            print("didn't fetch user: \(error)")
            return nil
        }
    }
        
    @IBAction func saveTestTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Editing profile", message: "Are you sure you want to save changes?", preferredStyle: .alert)
        let NoAction = UIAlertAction(title: "Cancel", style: .default) {
            (_) in
            self.dismiss(animated: true, completion: nil)
        }
        let OkAction = UIAlertAction(title: "Sure", style: .default) {
            (_) in
            let newUs = self.editUsernameTF.text
            let newEmail = self.editEmailTF.text
            let newAddress = self.editAddressTF.text
            let newCumple = self.newBirthday.date
            let newPassword = self.editPasswordTF.text
            let id = Int16(self.idProfile.text!)
            self.rewriteValues(id: id ?? 0, newUsername: newUs, newUsernameLabel: self.usernameProfile, newEmail: newEmail, newEmailLabel: self.emailProfile, newBirthday: newCumple, newBirthdayLabel: self.birthdayProfile, newAddress: newAddress, newAddressLabel: self.adressProfile, newPassword: newPassword)
            self.needToTapEdit()
            self.saveTest.isHidden = true
            self.editProfileButton.isHidden = false
        }
        alert.addAction(NoAction)
        alert.addAction(OkAction)
        self.present(alert, animated: true, completion: nil)
    }
}
