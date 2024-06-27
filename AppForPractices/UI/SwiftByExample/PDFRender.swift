//
//  PDFRender.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

@MainActor
struct PDFRender: View {
    @State private var image = Image(systemName: "photo")

    var body: some View {
        Group{
            ShareLink("Export PDF", item: render())
            image
                       .resizable()
                       .scaledToFit()
                       .frame(width: 300, height: 300)
                       .dropDestination(for: Data.self) { items, location in
                           guard let item = items.first else { return false }
                           guard let uiImage = UIImage(data: item) else { return false }
                           image = Image(uiImage: uiImage)
                           return true
                       }
        }
    }
    
    func render()->URL{
        let renderer = ImageRenderer(content:
        Text("Hello , worlds")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
        )
        
        let url = URL.documentsDirectory.appending(path: "ouput.pdf")
        renderer.render{ size , context in
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            guard let pdf = CGContext(url as CFURL , mediaBox: &box ,nil) else {
                return
            }
            pdf.beginPDFPage(nil)
            context(pdf)
            
            pdf.endPage()
            pdf.closePDF()
        }
        return url
    }
}

#Preview {
    PDFRender()
}
