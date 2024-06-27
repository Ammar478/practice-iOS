//
//  ScrollViewIndicatorCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import Foundation
import SwiftUI

final class ScrollViewIndicatorCoordinator:ResetableCoordinator{
    
    @Published var pathState = PathNabigationStackPathState()

    var rootView: some View{
        PathNavigationStack(pathState: self.pathState){
            ScrollViewIndicatorVoew()
                .navigationTitle("Scroll View Indicator")
        }
        .environment(\.coordinator ,self)

    }
    
    func reset() {
        self.pathState.clear()
    }
}


extension ScrollViewIndicatorCoordinator{
    
    func link<T>(value: T) where T : Hashable {
        self.pathState.path.append(value)
    }
}
