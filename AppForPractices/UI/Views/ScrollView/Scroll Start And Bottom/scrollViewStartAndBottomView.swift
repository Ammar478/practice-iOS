//
//  scrollViewStartAndBottomView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import SwiftUI

struct scrollViewStartAndBottomView: View {
    var body: some View {
        Group{
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0..<50){number in
                        Text("Number \(number)")
                            .padding(.horizontal)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(.secondary)
                            .clipShape(.rect(cornerRadius: 20))
                            .padding()
                    }
                }
            }
            .defaultScrollAnchor(.trailing)
            
            Spacer()
            Divider()
            Spacer()
            
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(0..<10){number in
                            Text("Number\(number)")
                            .padding(.horizontal)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(.secondary)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                }
            }
            .defaultScrollAnchor(.center)
            .scrollTargetBehavior(.paging)
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    scrollViewStartAndBottomView()
}
