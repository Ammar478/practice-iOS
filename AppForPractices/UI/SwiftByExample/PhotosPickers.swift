//
//  PhotosPickers.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 04/06/2024.
//

import PhotosUI
import SwiftUI

struct PhotosPickers: View {
    @State private var avatarItem:PhotosPickerItem?
    @State private var avatarImage:Image?
    
    var body: some View {
        VStack{
            PhotosPicker("Select Avatar", selection: $avatarItem, matching: .images)
            
            avatarImage?
                .resizable()
                .scaledToFit()
//                .frame(width: 300, height: 300)
                .clipShape(Circle())
        }
        .onChange(of:avatarItem){
            Task{
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self){
                    avatarImage = loaded
                }else {
                    print("Failed")
                }
            }
        }
    }
}

#Preview {
    PhotosPickers()
}
