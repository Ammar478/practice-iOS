//
//  TextFieldExpand.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 04/06/2024.
//

import SwiftUI

struct TextFieldExpand: View {
    
    @State private var bio = "About me"
    
    var body: some View {
        VStack{
            TextField("Describe your", text: $bio ,axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(3,reservesSpace: true)
            
            Text(bio)
        }
        .padding()
    }
}

#Preview {
    TextFieldExpand()
}
