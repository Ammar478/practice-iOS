//
//  DashboardCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 28/05/2024.
//

import Foundation
import SwiftUI

final class DashboardCoordinator:Coordinator{
    
    let dressCodeCheck = DressCodeCoordinator()
    let scrollViewNew = ScrollViewCoordinator()
    
    
    var rootView: some View{
        NavigationStack{
            CustomizeTheWayOpenLins()

            DashboardView(dressCodeCheck: self.dressCodeCheck ,
                          scrollViewNew: self.scrollViewNew)
        }
    }
}
