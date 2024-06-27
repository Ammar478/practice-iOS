//
//  DashboardView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 28/05/2024.
//

import SwiftUI

struct DashboardView: View {
    let dressCodeCheck:DressCodeCoordinator
    let scrollViewNew:ScrollViewCoordinator
    
    var body: some View {
        CoordinatorList{
            self.dressChecking
        }
    }
    
    @ViewBuilder private var dressChecking: some View {
        CoordinatorGroup(title: "title", subTitle: "SubTitle"){
            HStack(alignment:.top ,spacing: 12){
                CoordinatorItem(text: "Scroll View",
                                iconImage: Image(systemName: "plus"),
                                coordinator: self.scrollViewNew)
                    .padding(12)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                CoordinatorItem(text: "Dress checking",
                                iconImage: Image(systemName: "plus"),
                                coordinator: self.dressCodeCheck)
                    .padding(12)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}

