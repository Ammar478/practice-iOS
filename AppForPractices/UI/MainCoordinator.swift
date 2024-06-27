//
//  MainCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 28/05/2024.
//

import Foundation
import SwiftUI


final class MainCoordinator:Coordinator {
    
    var rootView: some View{
        
        DashboardCoordinator().rootView
        
    }
}
