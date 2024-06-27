//
//  HideTabBarView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct HideTabBarView: View {
    var body: some View {
        TabView{
            NavigationStack {
                NavigationLink("Tap Me", destination: DetailsView.init)
                    .navigationTitle("Primary View")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
        }
    }
}

struct DetailsView:View {
    @State private var showNavigationBar = true

    var body: some View {
        Text("Detail View")
            .toolbar(showNavigationBar ? .visible : .hidden)
            .onTapGesture {
                withAnimation {
                    showNavigationBar.toggle()
                }
            }
    }
}

#Preview {
    HideTabBarView()
}
