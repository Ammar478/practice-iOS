//
//  FindAndReplaceText.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 04/06/2024.
//

import SwiftUI

struct FindAndReplaceText: View {
    @State private var bio = "Describe"
    @State private var isShowFindNavigator = false
    
    var body: some View {
        NavigationStack{
            TextEditor(text: $bio)
                .findNavigator(isPresented: $isShowFindNavigator)
                .replaceDisabled()
                .toolbar{
                    Button("Toggle swarch"){
                        isShowFindNavigator.toggle()
                    }
                }
                .navigationTitle("Edit Bito")
        }
    }
}

#Preview {
    FindAndReplaceText()
}
