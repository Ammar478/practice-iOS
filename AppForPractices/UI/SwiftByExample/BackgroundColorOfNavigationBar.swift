//
//  BackgroundColorOfNavigationBar.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct BackgroundColorOfNavigationBar: View {
    var body: some View {
        NavigationStack{
            List(0..<30){
                Text("Row \($0)")
            }
            .navigationTitle("30 rows")
            .toolbarBackground(.teal)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BackgroundColorOfNavigationBar()
}
