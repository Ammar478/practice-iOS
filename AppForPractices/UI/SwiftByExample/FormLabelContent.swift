//
//  FormLabelContent.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 04/06/2024.
//

import SwiftUI

struct FormLabelContent: View {
    var body: some View {
        Form {
            LabeledContent {
                Slider(value: .constant(0.3))
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
                Text("Subsubsubtitle")
                Text("Subsubsubtitle")

          

            }
        }    }
}

#Preview {
    FormLabelContent()
}
