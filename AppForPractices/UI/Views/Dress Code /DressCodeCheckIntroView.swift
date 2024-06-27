//
//  DressCodeCheckIntroView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 26/05/2024.
//

import SwiftUI

struct DressCodeCheckIntroView: View {
    
    @Environment(\.userRole) var userRole
    
    enum Link {
        case takeSelefie
    }
    
    let user:User
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment:.leading,spacing: 20){
                if let userRole = self.userRole,
                   [.driver ,.rsgUser].contains(userRole){
                    if userRole == .driver {
                        Text("Driver")
                    }else if userRole == .rsgUser {
                        Text("User")
                    }
                }else {
                    Text("not one of them ")
                }
                    
                    Image("plus.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.red)
                    Image("plus.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.green)
                    Image("plus.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue)
                    Image("plus.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.purple)
                    Image("plus.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.pink)
                
                Spacer()
                
                Text("Grooming:")
                    
                
                    
            }
            .padding()
            .navigationTitle("dd")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom) {
                VStack(spacing:16){
                    NavigationLink(value:Link.takeSelefie){
                        Text("Take a Selfie")
                    }
                    .buttonStyle(.regFilled)
                }
                .padding([.leading,.trailing,.bottom],12)
                .padding(.top , 8)
                .background()
            }
        }
     
        
      
    }
}

#Preview {
    DressCodeCheckIntroView(user: .sample)
}

enum UserRole:String,Codable {
    case driver = "driver"
    case rsgUser = "rsg_user"
    
    var description :String {
        switch self {
        case .driver: return "Driver"
        case .rsgUser: return "User"
        }
    }
}
