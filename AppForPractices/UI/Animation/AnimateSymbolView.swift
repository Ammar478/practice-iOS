//
//  AnimateSymbolView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct AnimateSymbolView: View {
    @State private var petCount = 0
    @State private var isFavorite = false
    var body: some View {
        
            VStack{
                Button{
                    petCount += 1
                    isFavorite.toggle()
                }label: {
                    Label("Pet the dog", systemImage: isFavorite ?  "checkmark" : "heart")
                }
                .contentTransition(.symbolEffect(.replace))
                
                Button{
                    petCount += 1
                }label: {
                    Label("Pet the dog", systemImage: "square.stack.3d.up")
                }
                .symbolEffect(.variableColor.iterative , options: .repeat(2))
                 
            }
            .font(.largeTitle)
            
            
            
        }
    
}

#Preview {
    AnimateSymbolView()
}
