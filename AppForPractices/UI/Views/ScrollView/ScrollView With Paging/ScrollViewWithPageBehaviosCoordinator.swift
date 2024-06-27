//
//  ScrollViewWithPageBehaviosCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import Foundation
import SwiftUI

final class ScrollViewWithPageBehaviosCoordinator:ResetableCoordinator{
    
    @Published var pathState = PathNabigationStackPathState()

    
    var rootView: some View{
        NavigationStack{
            scrollViewWithPagingView()
                .navigationTitle("Scroll View with ppaging between the children")
        }
        .environment(\.coordinator ,self)
    }
    
    func reset() {
        self.pathState.clear()
    }
}

extension ScrollViewWithPageBehaviosCoordinator {
    func link<T>(value: T) where T : Hashable {
        self.pathState.path.append(value)
    }
}
