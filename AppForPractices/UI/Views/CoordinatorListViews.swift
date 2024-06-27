//
//  CoordinatorListViews.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 28/05/2024.
//

import SwiftUI

struct CoordinatorList<Content:View>:View {
    
    @ViewBuilder var listBuilder:() -> Content
    
    var body: some View{
        List{
            self.listBuilder()
        }
        .scrollContentBackground(.hidden)
    }
}

struct CoordinatorGroup<Content:View>:View {
    let title:String
    let subTitle:String?
    @ViewBuilder var groupOfBuilder: ()-> Content
    
    init(title: String, subTitle: String?, groupOfBuilder: @escaping () -> Content) {
        self.title = title
        self.subTitle = subTitle
        self.groupOfBuilder = groupOfBuilder
    }
    
    var body: some View{
        Section{
            self.groupOfBuilder()
        }header: {
            VStack(alignment:.leading){
                Text(self.title)
                    .font(.title)
                
                if let SubTitle = self.subTitle,
                   !SubTitle.isEmpty{
                    Text(SubTitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 20, trailing: 0))
            
        }
        .headerProminence(.increased)
    }
}


struct CoordinatorItem<T: ResetableCoordinator>: View {
    let text: String
    let iconImage: Image
    let axis: Axis
    let coordinator: T
    
    @State private var presented: Bool = false
    
    init(text: String, iconImage: Image, axis: Axis = .horizontal, coordinator: T) {
        self.text = text
        self.iconImage = iconImage
        self.axis = axis
        self.coordinator = coordinator
    }
    
    var body: some View {
        Button {
            self.presented = true
        } label: {
            let content = Group {
                self.iconImage
                    .iconBackground()
                Text(self.text)
                    .font(.callout)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: self.axis == .vertical ? .topLeading : .leading)
            }
            if axis == .vertical {
                VStack(alignment: .leading, spacing: 12) {
                    content
                }
            } else {
                HStack(alignment: .center, spacing: 12) {
                    content
                }
            }
        }
        .buttonStyle(.borderless)
        .listRowInsets(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
        .sheet(isPresented: self.$presented) {
            self.coordinator.reset()
        } content: {
            self.coordinator.rootView
        }
    }
}

