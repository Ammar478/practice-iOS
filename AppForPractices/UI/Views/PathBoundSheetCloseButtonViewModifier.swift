//
//  PathBoundSheetCloseButtonViewModifier.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 28/05/2024.
//

import Foundation
import SwiftUI


struct PathBoundSheetCloseButtonViewModifier:ViewModifier {
    @ObservedObject var pathState:PathNabigationStackPathState
    @State private var showTheCancelConformation:Bool
    let dismissConfirmationTitle: String
    let dismissConfiramtionMessage: String
    let buttonText: String
    
    init(pathState: PathNabigationStackPathState,
         dismissConfirmationTitle: String,
         dismissConfiramtionMessage: String,
         buttonText: String) {
        self.pathState = pathState
        self._showTheCancelConformation = .init(initialValue: !pathState.path.isEmpty)
        self.dismissConfirmationTitle = dismissConfirmationTitle
        self.dismissConfiramtionMessage = dismissConfiramtionMessage
        self.buttonText = buttonText
    }
    
    func body(content: Content) -> some View {
        content.sheetCloseButton(showTheCancelConformation: $showTheCancelConformation,
                                 dismissConfirmationTitle: dismissConfirmationTitle, dismissConfiramtionMessage: dismissConfiramtionMessage, buttonText:buttonText)
        .task {
            showTheCancelConformation  = !pathState.path.isEmpty
        }
        .onChange(of: pathState.path){newValue in
            showTheCancelConformation = !newValue.isEmpty
        }
    }
}

struct SheetCloseButtonViewModifier: ViewModifier {
    @Environment(\.dismissSheet) private var dismissSheet
    @State private var showConfirmation = false
    
    let buttonText: String
    @Binding var showDismissConfirmation: Bool
    let dismissConfirmationTitle: String
    let dismissConfiramtionMessage: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(buttonText) {
                        if showDismissConfirmation {
                            self.showConfirmation = true
                        } else {
                            self.dismissSheet()
                        }
                    }
                }
            }
            .alert(dismissConfirmationTitle, isPresented: $showConfirmation) {
                Button("No", role: .cancel) {
                    self.showConfirmation = false
                }
                Button("Yes", role: .destructive) {
                    self.dismissSheet()
                }
            } message: {
                Text(dismissConfiramtionMessage)
            }
        
    }
}

extension View {
    func sheetCloseButton(showTheCancelConformation:Binding<Bool> = .constant(false),
                          dismissConfirmationTitle:String = String("Are you sure you want to go back?"),
                          dismissConfiramtionMessage:String = String("if you click yes you will remove every thing ."),
                          buttonText:String = String("Cancel")) -> some View {
        modifier(SheetCloseButtonViewModifier(buttonText: buttonText,
                                              showDismissConfirmation: showTheCancelConformation,
                                              dismissConfirmationTitle: dismissConfirmationTitle,
                                              dismissConfiramtionMessage: dismissConfiramtionMessage))
        
    }
    
    func sheetCloseButton(pathState:PathNabigationStackPathState,
                          buttonText:String = String("Cancel"),
                          dismissConfirmationTitle:String = String("Are you sure you want to go back?"),
                          dismissConfiramtionMessage:String = String("if you click yes you will remove every thing .")) -> some View {
        modifier(PathBoundSheetCloseButtonViewModifier(pathState: pathState,
                                                       dismissConfirmationTitle: dismissConfirmationTitle,
                                                       dismissConfiramtionMessage: dismissConfiramtionMessage,
                                                       buttonText: buttonText))
    }
}
