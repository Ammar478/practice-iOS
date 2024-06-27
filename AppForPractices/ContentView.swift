//
//  ContentView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
       
            LazyVGrid(columns: [GridItem(.fixed(100),spacing: 10)]){
                ForEach(theTriningView.allCases, id:\.self){ view in
                    NavigationLink{
                        view.selectView
                            .navigationTitle(view.titleView)
                    }label:{
                        Text(view.titleView)
                    }
                }
            }
            .navigationTitle("trining")
        }
    }
}

#Preview {
    ContentView()
}

enum theTriningView:Hashable,CaseIterable{
    case imageView
    
    var selectView: some View {
        switch self {
        case .imageView: return ImagesView()
        }
    }
    
    var titleView:String {
        switch self {
        case .imageView : return "Image View"
        }
    }
}

