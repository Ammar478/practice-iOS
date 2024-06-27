//
//  SwiftUIToImage.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct SwiftUIToImage: View {
    @State private var text = "Your text here "
    @State private var renderedImage = Image(systemName: "photo")
    @Environment(\.displayScale) var displayScale
    
    
    
    var body: some View {
        VStack{
            renderedImage
            
            ShareLink("Export" , item: renderedImage, preview:SharePreview(Text("Shared image"), image:renderedImage))
            
            TextField("Enter some Text", text:$text)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        .onChange(of:text){_ in render()}
        .onAppear {render()}
    }
    
    @MainActor func render(){
        let renderer = ImageRenderer(content: RenderView(text: text))
        
        renderer.scale = displayScale
        
  
    }
}

#Preview {
    SwiftUIToImage()
}

struct RenderView:View {
    
    let text:String
    
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}
