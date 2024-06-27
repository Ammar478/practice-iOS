//
//  ScrollStartAndEndCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import Foundation
import SwiftUI

final class ScrollStartAndEndCoordinator:ResetableCoordinator{
    
    @Published var pathState = PathNabigationStackPathState()
    
    var rootView: some View{
        PathNavigationStack(pathState:self.pathState){
            scrollViewStartAndBottomView()
                .navigationTitle("Scroll View for position scroll triger")
        }
        .environment(\.coordinator ,self)

    }
    
    func reset() {
        self.pathState.clear()
    }
}

extension ScrollStartAndEndCoordinator{
    func link<T>(value: T) where T : Hashable {
        self.pathState.path.append(value)
    }
}
