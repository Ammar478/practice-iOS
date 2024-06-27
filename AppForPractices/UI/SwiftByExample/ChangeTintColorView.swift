//
//  ChangeTintColorView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct ChangeTintColorView: View {
    var body: some View {
        List(0..<51){i in
        Label("Row \(i)",systemImage: "\(i).circle")
                .listItemTint(.preferred(i.isMultiple(of: 2) ? .red : .green))
                .alignmentGuide(.listRowSeparatorLeading){d in
                    d[.leading]
                    
                }
        }
    }
}

#Preview {
    ChangeTintColorView()
}
