//
//  enviromentValue.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 26/05/2024.
//

import Foundation
import SwiftUI

extension EnvironmentValues{
    struct UserRoleKey:EnvironmentKey {
        static let defaultValue:UserRole? = nil
    }
    
    var userRole:UserRole? {
        get {self[UserRoleKey.self]}
        set { self[UserRoleKey.self] = newValue }
    }
}

extension EnvironmentValues {
    struct DismissSheetKey:EnvironmentKey {
        static let defaultValue: () -> () = {}
    }
    var dismissSheet:() -> () {
        get { self[DismissSheetKey.self] }
        set { self[DismissSheetKey.self] = newValue }
    }
}


extension EnvironmentValues {
    struct CoordinatorKey:EnvironmentKey {
        static let defaultValue: (any Coordinator)? = nil
    }
    
    var coordinator: (any Coordinator)? {
        get { self[CoordinatorKey.self] }
        set { self[CoordinatorKey.self] = newValue}
    }
}
