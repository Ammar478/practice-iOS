//
//  TextFieldToAlert.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 04/06/2024.
//

import SwiftUI

struct TextFieldToAlert: View {
    @State private var showingAlert = false
    @State private var name = ""
    @State private var isAuthenticating = false
    @State private var username = ""
    @State private var password = ""
    
    
    
    var body: some View {
        Button("Enter name"){
            isAuthenticating.toggle()
        }
        .alert("Log in", isPresented: $isAuthenticating) {
                   TextField("Username", text: $username)
                       .textInputAutocapitalization(.never)
                   SecureField("Password", text: $password)
                   Button("OK", action: authenticate)
                   Button("Cancel", role: .cancel) { }
               } message: {
                   Text("Please enter your username and password.")
               }
    }
    
    func authenticate(){
        if username == "twostraws" && password == "sekrit"{
            print("your are in !")
        }else{
            print("who are you ")
        }
    }
}

#Preview {
    TextFieldToAlert()
}
