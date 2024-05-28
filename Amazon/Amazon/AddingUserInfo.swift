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


func addUserData(status: Int?, userName: String?, email: String?, password: String?, birthday: Date?) -> Int16 {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let newUser = User(context: context)
    var id = newUser.id
    newUser.username = userName
    newUser.email = email
    newUser.password = password
    newUser.birthday = birthday
    newUser.status = Int16(status ?? 0)
    if status == 0 {
        id = Int16.random(in: 1...1000)
    }
    else {
        id = Int16.random(in: 1001...2000)
    }
    do {
        try context.save()
    } catch {
        print("Error saving context: \(error)")
    }
    return id
}
