//
//  Author.swift
//  GoHomeFast
//
//  Created by Allen on 2023/1/3.
//  Copyright © 2023 Allen. All rights reserved.
//

import SwiftUI

struct Author: View {
    @State private var degrees: Double = 0
    @State private var newDegrees: Double = 0
    @State private var moveDistance: CGFloat = 0
    @State private var opacity: Double = 1
    var body: some View {
        ZStack {
            VStack{
                VStack(alignment: .leading, spacing: 50) {
                    Image("peterpon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 350)
                        .clipped()
                        .rotationEffect(Angle.degrees(degrees))
                        .gesture(RotationGesture()
                            .onChanged { angle in
                                self.degrees = self.newDegrees + angle.degrees
                        }.onEnded { angle in
                            self.newDegrees = self.degrees
                        })
                    Group{
                        HStack {
                            Text("指導老師: 海大彭于晏Peter Pan")
                            Group{
                                LottieView(filename: "star")
                                    .frame(width: 50, height: 50)
                                LottieView(filename: "star")
                                    .frame(width: 50, height: 50)
                                LottieView(filename: "star")
                                    .frame(width: 50, height: 50)
                            }
                        }
                        Text("介紹: 海大最帥氣的老師,沒有之一")
                    }
                }
            }
        }
        .background(Image("train").resizable().opacity(0.3))
    }
}

struct Author_Previews: PreviewProvider {
    static var previews: some View {
        Author()
    }
}

struct heartMove: View {
    @Binding var moveDistance: CGFloat
    @Binding var opacity: Double
    var body: some View {
        HStack {
            Image("heart")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 25)
                .offset(x: moveDistance, y: 0)
                .opacity(opacity)
            Spacer()
        }
        .onAppear {
            self.moveDistance += 500
            self.opacity -= 0.2
        }
        .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
    }
}
