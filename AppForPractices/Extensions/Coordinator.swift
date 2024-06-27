//
//  Coordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 26/05/2024.
//

import Foundation
import SwiftUI

@available(iOS 13.0 ,macOS 10.15 ,tvOS 13.0 ,watchOS 6.0 , *)
public protocol Coordinator: ObservableObject {
    associatedtype RootView:View
    @ViewBuilder @MainActor var rootView:RootView {get}
    
    func link<T:Hashable>(value: T)
}

protocol ResetableCoordinator:Coordinator {
    func reset()
}

extension Coordinator {
    func link<T:Hashable>(value:T){
        assertionFailure("unimplemented")
    }
}
