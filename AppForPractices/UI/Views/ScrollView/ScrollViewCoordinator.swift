//
//  ScrollViewCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import Foundation
import SwiftUI

final class ScrollViewCoordinator:ResetableCoordinator{
    
    @Published var pathState = PathNabigationStackPathState()
    
    let scrollViewWithPagingOrBetweenChild:ScrollViewWithPageBehaviosCoordinator
    let scrollViewStartAndBottom:ScrollStartAndEndCoordinator
    let scrollViewIndicator:ScrollViewIndicatorCoordinator
    let scrollViewCustomTransition:ScrollViewCustomTransiationCoordinator
    
    init(){
        self.scrollViewCustomTransition = ScrollViewCustomTransiationCoordinator()
        self.scrollViewIndicator = ScrollViewIndicatorCoordinator()
        self.scrollViewStartAndBottom = ScrollStartAndEndCoordinator()
        self.scrollViewWithPagingOrBetweenChild = ScrollViewWithPageBehaviosCoordinator()
    }
    
    var rootView: some View{
        PathNavigationStack(pathState:self.pathState){
            ScrollViewSnapView(scrollViewWithPagingOrBetweenChild: self.scrollViewWithPagingOrBetweenChild, scrollViewStartAndBottom: self.scrollViewStartAndBottom, scrollViewIndicator: self.scrollViewIndicator, scrollViewCustomTransition: self.scrollViewCustomTransition)
            .navigationTitle("ScrollView iOS 17")
        }
        .navigationDestination(for: ScrollViewSnapView.ScrollCases.self){ link in
            
            switch link {
            case .scrollViewCustomTransition:
                scrollViewCustomTransitionView()
            case .scrollViewIndicator:
                ScrollViewIndicatorVoew()
            case.scrollViewStartAndBottom:
                scrollViewStartAndBottomView()
            case .scrollViewWithPagingOrBetweenChild:
                scrollViewWithPagingView()
            }
        }
        .environment(\.coordinator , self)
    }
    
    func reset() {
        self.pathState.clear()
    }
}

extension ScrollViewCoordinator{
    func link<T>(value: T) where T : Hashable {
        self.pathState.path.append(value)
    }
}
