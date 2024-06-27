//
//  LayerEffectsView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct LayerEffectsView: View {
    var body: some View {
        ScrollView{
            ForEach(0..<100){i in
                Text("Row \(i)")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .visualEffect{ content, proxy in
                        content.blur(radius: blurAmount(for: proxy))
                    }
            }
        }
        .defaultScrollAnchor(.center )

    }
    
    func blurAmount(for proxy: GeometryProxy) -> Double {
        let scrollViewHeight = proxy.bounds(of: .scrollView)?.height ?? 100
        let ourCenter = proxy.frame(in: .scrollView).midY
        let distanceFromCenter = abs(scrollViewHeight / 2 - ourCenter)
        return Double(distanceFromCenter) / 150
    }
}

#Preview {
    LayerEffectsView()
}
