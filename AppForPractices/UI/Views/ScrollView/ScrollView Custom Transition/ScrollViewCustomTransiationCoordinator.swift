//
//  ScrollViewCustomTransiationCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import Foundation
import SwiftUI

final class ScrollViewCustomTransiationCoordinator:ResetableCoordinator{
    @Published var pathState = PathNabigationStackPathState()

    
    var rootView: some View{
        PathNavigationStack(pathState: pathState){
            scrollViewCustomTransitionView()
                .navigationTitle("Scroll View Custom Transiation ")
                .sheetCloseButton(pathState: self.pathState)
        }
        .environment(\.coordinator ,self)
    }
    
    func reset() {
        self.pathState.clear()
    }
}

extension ScrollViewCustomTransiationCoordinator{
    func link<P: Hashable>(value: P) {
        self.pathState.path.append(value)
    }
}
