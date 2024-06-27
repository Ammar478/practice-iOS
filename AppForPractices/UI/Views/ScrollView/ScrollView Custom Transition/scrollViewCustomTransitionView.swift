//
//  scrollViewCustomTransitionView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 30/05/2024.
//

import SwiftUI

struct scrollViewCustomTransitionView: View {
    var body: some View {
        Group{
            ScrollView{
                ForEach(0..<10){i in
                            RoundedRectangle(cornerRadius: 25.0)
                        .fill(.orange)
                        .frame(height: 80)
                        .padding()
                        .overlay(
                            Text("number \(i)")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                        )
                        .scrollTransition(.animated.threshold(.visible(0.9))){content,phase in
                            content
                                .opacity(phase.isIdentity ? 1 :0)
                                .scaleEffect(phase.isIdentity ? 1 : 0.85)
                                .blur(radius: phase.isIdentity ? 0 : 9)
                            
                        }
                    
                    
                }
            }
            
            Spacer()
            Divider()
            Spacer()
            
            ScrollView{
                ForEach(0..<10){i in
                            RoundedRectangle(cornerRadius: 25.0)
                        .fill(.orange)
                        .frame(height: 80)
                        .padding()
                        .overlay(
                            Text("number \(i)")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                        )
                        .scrollTransition(.animated.threshold(.visible(0.9))){content,phase in
                            content
                                .hueRotation(.degrees(30 * phase.value))
                            
                        }
                    
                    
                }
            }
        }
    }
}

#Preview {
    scrollViewCustomTransitionView()
}
