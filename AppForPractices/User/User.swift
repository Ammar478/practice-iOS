//
//  User.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 26/05/2024.
//

import Foundation

struct User:Codable {

    enum Gender:Codable {
        case male
        case female
    }
    
    let gender:Gender
    
    static let sample:Self = Self(gender: .male)
}
