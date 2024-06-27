//
//  RSGFilledButtonStyle.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 22/05/2024.
//

import Foundation
import SwiftUI

struct RSGFilledButtonStyle:ButtonStyle {
    @Binding var endabled:Bool
    
    func makeBody(configuration: Configuration) -> some View {
        let color = endabled ? Color.accentColor : Color.accentColor.opacity(0.4)
        configuration.label
            .font(.headline)
            .fontWeight(.semibold)
            .frame(alignment: .center)
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(color ,in:RoundedRectangle(cornerRadius: 16))
            .foregroundStyle(.white)
    }
}

extension ButtonStyle where Self == RSGFilledButtonStyle {
    static var regFilled: Self {Self(endabled: .constant(true))}
    static func rsgFilled(endabled:Binding<Bool>)-> Self { Self(endabled: endabled)}
}
