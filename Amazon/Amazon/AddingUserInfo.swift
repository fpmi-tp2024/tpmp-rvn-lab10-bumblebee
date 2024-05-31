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

func addUserData(status: Int?, userName: String?, email: String?, password: String?, birthday: Date?, address: String?) -> Int16 {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let newUser = User(context: context)
    newUser.username = userName
    newUser.email = email
    newUser.password = password
    newUser.birthday = birthday
    newUser.address = address
    newUser.status = Int16(status ?? 0)
    let id: Int16
       if let status = status, status == 0 {
           id = Int16.random(in: 1...1000)
       } else {
           id = Int16.random(in: 1001...2000)
       }
       newUser.id = id
       do {
           try context.save()
           print("saved with id: \(id)")
           return id
       } catch {
           print("didn't save user: \(error)")
       }
    return id
}
