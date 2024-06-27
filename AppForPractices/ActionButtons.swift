//
//  ActionButtons.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 22/05/2024.
//

import SwiftUI

struct ActionButtons: View {
    @State private var isLoading:Bool = false
    @ViewBuilder
    func actionButton() -> some View {
        if isLoading {
            Button{}label: {
                ProgressView()
                    .tint(.white)
                    .progressViewStyle(.circular)
            }
            .buttonStyle(.rsgFilled(endabled: .constant(false)))
            .padding(.horizontal, 16)
            .padding(.vertical,8)
        } else{
            Button{
                print("hello")
            }label: {
                Text("Sign in ")
                    .font(.body)
            }
            .buttonStyle(.rsgFilled(endabled: .constant(false)))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
    var body: some View {
        actionButton()
    }
}

#Preview {
    ActionButtons()
}
