//
//  ContentView.swift
//  CarouselView
//
//  Created by Minsang Choi on 12/14/24.
//

import SwiftUI

struct ContentView: View {
    @State var itemwidth : Double = 300
    @State var spacing : Double = 40
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:-spacing){
                    ForEach(1..<10) { id in
                        let number = String("00\(id)")
                        ZStack{
                            LinearGradient(colors: [.indigo,.red], startPoint: .topLeading, endPoint: .bottomTrailing)
                            Text(number)
                                .font(.system(size: 14, design:.monospaced))
                                .bold()
                                .foregroundStyle(.white)
                        }
                        .frame(width:itemwidth,height:240)
                        .cornerRadius(20)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.2)
                                .rotation3DEffect(
                                    Angle(degrees: phase.isIdentity ? 0 : phase.value * -40),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )

                        }
                    }
                }
                .scrollTargetLayout()
                .frame(maxWidth: .infinity)
                .padding()
            }
            .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
            .contentMargins(spacing)
        
            VStack {
                Spacer()
                HStack{
                    Text(String(format: "%.2f", itemwidth))                        .font(.system(size: 12, design: .monospaced))
                        .foregroundStyle(.white)
                    Slider(value: $itemwidth, in:240...300)
                        .tint(.white)
                }
                HStack{
                    Text(String(format: "%.2f", spacing))                        .foregroundStyle(.white)
                        .font(.system(size: 12, design: .monospaced))
                    Slider(value: $spacing, in:0...100)
                        .tint(.white)
                }

            }
            .padding()

        }
    }
}

#Preview {
    ContentView()
}
