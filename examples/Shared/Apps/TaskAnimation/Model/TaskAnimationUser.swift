//
//  User.swift
//  TaskAnimation (iOS)
//
//  Created by Balaji on 01/03/22.
//

import SwiftUI

// MARK: User Model and Sample Data
struct TaskAnimationUser: Identifiable{
    var id = UUID().uuidString
    var name: String
    var image: String
    var type: String
    var amount: String
    var color: Color
}

var taskAnimationUsers: [TaskAnimationUser] = [

    TaskAnimationUser(name: "iJustine", image: "TaskAnimationUser1", type: "Sent", amount: "-$120", color: Color.black),
    TaskAnimationUser(name: "Jessica", image: "TaskAnimationUser3", type: "Received", amount: "+$35", color: Color("TaskAnimationOrange")),
    TaskAnimationUser(name: "Jenna", image: "TaskAnimationUser2", type: "Rejected", amount: "-$20", color: Color.red),
    TaskAnimationUser(name: "Rebecca", image: "TaskAnimationUser4", type: "Received", amount: "+$40", color: Color("TaskAnimationOrange")),
]
