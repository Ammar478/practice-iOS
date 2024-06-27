//
//  ScrollViewIndicatorVoew.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import SwiftUI

struct ScrollViewIndicatorVoew: View {
    var body: some View {
        Group{
            ScrollView{
                LazyVStack{
                    ForEach(0..<50){number in
                        Text("Number \(number) ")
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(.secondary)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                }
            }
            .defaultScrollAnchor(.bottom)
            .contentMargins(.bottom,200,for:.scrollContent)
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ScrollViewIndicatorVoew()
}
