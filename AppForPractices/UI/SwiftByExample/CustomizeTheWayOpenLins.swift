//
//  CustomizeTheWayOpenLins.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 04/06/2024.
//

import SwiftUI

struct CustomizeTheWayOpenLins: View {
    var body: some View {
        VStack{
            Link("Visit Apple", destination: URL(string: "https://apple.com")!)
            Text("[Visit Apple](https://apple.com)")
        }
        .environment(\.openURL,OpenURLAction(handler: handleURL))
    }
    func handleURL(_ url:URL) -> OpenURLAction.Result{
        print("Handle \(url) somehow")
        return .handled
    }
}

#Preview {
    CustomizeTheWayOpenLins()
}
