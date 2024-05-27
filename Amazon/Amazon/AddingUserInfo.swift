//
//  AddingUserInfo.swift
//  Amazon
//
//  Created by Victoria Samsonova on 28.05.24.
//

import Foundation
import CoreData
import UIKit
import CoreLocation

var appDelegate = UIApplication.shared.delegate as! AppDelegate

func addUserData(status: Int?, userName: String?, email: String?, password: String?, birthday: Date?) {
    let newObject = NSEntityDescription.insertNewObject(forEntityName: "User", into: appDelegate.persistentContainer.viewContext) as NSManagedObject;
    newObject.setValue(userName, forKey: "username")
    newObject.setValue(email, forKey: "email")
    newObject.setValue(password, forKey: "password")
    newObject.setValue(birthday, forKey: "birthday")
    if status == 0 {
        newObject.setValue("Customer", forKey: "status")
    }
    else {
        newObject.setValue("Vendor", forKey: "status")
    }
    
}
