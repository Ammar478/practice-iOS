//
//  scrollViewWithPagingView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import SwiftUI

struct scrollViewWithPagingView: View {
    var body: some View {
        Group{
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(0..<10){ number in
                        Text("Texting \(number)")
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal,40)
            Spacer()
            
            
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(0..<10){number in
                    Text("the vertival \(number)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(.secondary)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    scrollViewWithPagingView()
}
