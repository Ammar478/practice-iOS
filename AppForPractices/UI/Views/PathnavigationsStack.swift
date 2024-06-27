//
//  PathnavigationsStack.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 27/05/2024.
//

import Foundation
import SwiftUI

class PathNabigationStackPathState:ObservableObject{
    @Published var path:NavigationPath = NavigationPath()
    
    func clear(){
        Task{@MainActor  in
            path.clear()
        }
    }
}

extension NavigationPath {
    
    @MainActor
    mutating func clear(){
        removeLast(count)
    }
}

struct PathNavigationStack<Content:View>:View {
    @Environment(\.dismiss) private var dismissAction
    
    @ObservedObject var pathState: PathNabigationStackPathState
    @ViewBuilder var content:Content
    var body: some View {
        NavigationStack(path:self.$pathState.path){
            self.content
        }
        .background(Color.secondary)
        .environment(\.dismissSheet,{
            self.dismissAction()
            self.pathState.clear()
        })
    }
}
