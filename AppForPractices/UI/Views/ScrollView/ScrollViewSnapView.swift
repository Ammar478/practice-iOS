//
//  ScrollViewSnapView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import SwiftUI

struct ScrollViewSnapView: View {
    
    let scrollViewWithPagingOrBetweenChild:ScrollViewWithPageBehaviosCoordinator
    let scrollViewStartAndBottom:ScrollStartAndEndCoordinator
    let scrollViewIndicator:ScrollViewIndicatorCoordinator
    let scrollViewCustomTransition:ScrollViewCustomTransiationCoordinator
    
    enum ScrollCases:CaseIterable{
        case scrollViewWithPagingOrBetweenChild
        case scrollViewStartAndBottom
        case scrollViewIndicator
        case scrollViewCustomTransition
        
        var title:String {
            switch self {
            case .scrollViewCustomTransition:
                return "Scroll Custom Transition"
            case .scrollViewIndicator:
                return "Scroll Indicator"
            case .scrollViewStartAndBottom:
                return "Scroll Position"
            case .scrollViewWithPagingOrBetweenChild:
                return "Scroll behaviower"
            }
        }
        
    }
    
    var body: some View {
        CoordinatorList{
            self.scrollViewBuilder
        }
    }
    
    @ViewBuilder private var scrollViewBuilder: some View {
        HStack(alignment:.top,spacing: 20){
            CoordinatorItem(text: "croll Custom Transition",
                            iconImage: Image(systemName: "plus"),
                            coordinator: self.scrollViewCustomTransition)
                .padding(12)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
              
            }
    }
}

