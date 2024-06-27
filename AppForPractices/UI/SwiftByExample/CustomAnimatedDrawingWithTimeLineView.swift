//
//  CustomAnimatedDrawingWithTimeLineView.swift
//  AppForPractices
//
//  Created by Ammar Alsanani on 03/06/2024.
//

import SwiftUI

struct CustomAnimatedDrawingWithTimeLineView: View {
    
    @StateObject private var storm = Strom()
    let rainColor = Color(red:0.25 , green: 0.65 , blue:0.75)
    
    
    var body: some View {
        TimelineView(.animation){timeline in
            Canvas{context ,size in
                storm.update(to: timeline.date)
                
                for drop in storm.drops {
                    let age = timeline.date.distance(to: drop.removalDate)
                    let rect = CGRect(x: drop.x * size.width , y:size.height - (size.height * age * drop.speed), width: 3, height: 10)
                    let shape = Capsule().path(in: rect)
                    
                    context.fill(shape, with: .color(rainColor))
                }
            }
        }
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    CustomAnimatedDrawingWithTimeLineView()
}

struct RainDrop:Hashable,Equatable {
    var x:Double
    var removalDate:Date
    var speed:Double
}

class Strom:ObservableObject{
    var drops = Set<RainDrop>()
    
    func update(to date:Date){
        drops = drops.filter{$0.removalDate > date}
        drops.insert(RainDrop(x: Double.random(in: 0...2), removalDate: date + 1, speed: Double.random(in: 1...3)))
    }
}
