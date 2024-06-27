//
//  CustomizeToolbarButtons.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 04/06/2024.
//

import SwiftUI

struct CustomizeToolbarButtons: View {
    var body: some View {
        NavigationStack{
            Text("SwiftUI")
                .navigationTitle("")
                .toolbar(id:"options"){
                    ToolbarItem(id:"settings" , placement:.primaryAction){
                        ControlGroup{
                            Button{
                                
                            }label: {
                                Label("Decrease fontSise",systemImage: "textformat.size.smaller")
                            }
                            
                            Button{
                                
                            }label: {
                                Label("Increase fontSise",systemImage: "textformat.size.larger")
                            }
                            
                            Button{
                                
                            }label: {
                                Label("Font Size",systemImage: "textformat.size")
                            }
                            
                        }
                    }
                    
                  
                }
                .toolbarRole(.editor)
        }
    }
}

#Preview {
    CustomizeToolbarButtons()
}
