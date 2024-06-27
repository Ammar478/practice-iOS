//
//  AppForPracticesApp.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 22/05/2024.
//

import SwiftUI

@main
struct AppForPracticesApp: App {
    @StateObject var mainCoordinator:MainCoordinator
    var body: some Scene {
        WindowGroup {
            self.mainCoordinator.rootView
        }
    }
    init() {
        do {
            let mainCoordinator =  MainCoordinator()
            _mainCoordinator = .init(wrappedValue: mainCoordinator)
        } catch {
            preconditionFailure("general failure: \(error.localizedDescription)")
        }
    }
}
