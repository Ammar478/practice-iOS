//
//  Image.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 22/05/2024.
//

import Foundation
import SwiftUI

extension Image {
    func iconBackground() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .padding(8)
            .foregroundStyle(.blue)
            .background(.black)
            .background(in: RoundedRectangle(cornerRadius: 8))
    }
    
    func squareIcon() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(6)
            .foregroundStyle(Color.accentColor)
            .background(Color(red:0.8 , green: 0.9,blue: 0.9))
            .background(in:Rectangle())
            .frame(width: 40,height: 40)
            .cornerRadius(12)
    }
    
    func backgroundFit() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
