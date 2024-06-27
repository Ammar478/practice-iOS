//
//  ImagesView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 22/05/2024.
//

import SwiftUI

struct ImagesView: View {
    var body: some View {
        VStack{
            Image("greeting").backgroundFit()
        }
        .onAppear(){
            
            Task{
                try await Task.sleep(timeInterval:300)
                print("hello words")
            }
        }
    }

}

#Preview {
    ImagesView()
}
