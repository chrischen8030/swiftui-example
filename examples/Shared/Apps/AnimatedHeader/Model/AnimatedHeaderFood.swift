//
//  Food.swift
//  Animated Header (iOS)
//
//  Created by Balaji on 09/01/21.
//

import SwiftUI

// Food Model And Sample Food items....

struct AnimatedHeaderFood: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}


var animatedHeaderfoods = [

    AnimatedHeaderFood(title: "Choclate Cake", description: "Chocolate cake or chocolate gâteau is a cake flavored with melted chocolate, cocoa powder, or both", price: "$19",image: "choclates"),
    AnimatedHeaderFood(title: "Cookies", description: "A biscuit is a flour-based baked food product. Outside North America the biscuit is typically hard, flat, and unleavened", price: "$10",image: "cookies"),
    AnimatedHeaderFood(title: "Sandwich", description: "Trim the bread from all sides and apply butter on one bread, then apply the green chutney all over.", price: "$9",image: "sandwich"),
    AnimatedHeaderFood(title: "French Fries", description: "French fries, or simply fries, chips, finger chips, or French-fried potatoes, are batonnet or allumette-cut deep-fried potatoes.", price: "$15",image: "fries"),
    AnimatedHeaderFood(title: "Pizza", description: "Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped", price: "$39",image: "pizza"),
]

