//
//  AdjustListRow.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct AdjustListRow: View {
    var body: some View {
        NavigationStack{
            List(0..<15){i in
            Label("Row the nuame of the  \(i)", systemImage: "\(i).circle")
                    .alignmentGuide(.listRowSeparatorLeading){d in
                        d[.leading]
                    }
                Label(
                    title: { Text("nameds") },
                    icon: { Image(systemName: "\(i).circle") }
)
            }
        }
    }
}

#Preview {
    AdjustListRow()
}
