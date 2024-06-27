//
//  DressCodeCoordinator.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 28/05/2024.
//

import Foundation
import SwiftUI


final class DressCodeCoordinator:ResetableCoordinator{
   
    @Published var pashState = PathNabigationStackPathState()
    
    var rootView: some View{
        PathNavigationStack(pathState: self.pashState){
            Group{
                DressCodeCheckIntroView(user: .sample)
                    .preferredColorScheme(.light)
                    .navigationTitle("Dress code checker")
                    .sheetCloseButton(pathState: pashState)
            }
            .navigationDestination(for: DressCodeCheckIntroView.Link.self){link in
                switch link {
                case .takeSelefie:
                     DressCodeTakeSelfiView()
                }
            }
        }
        .environment(\.coordinator, self)
    }
    
    func reset() {
        self.pashState.clear()
    }
}
