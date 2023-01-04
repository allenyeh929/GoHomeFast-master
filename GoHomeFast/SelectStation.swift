//
//  SelectStation.swift
//  GoHomeFast
//
//  Created by Allen on 2023/1/3.
//  Copyright © 2023 Allen. All rights reserved.
//

import SwiftUI

struct SelectStation: View {
    @State private var stations = [Station]()
    @State private var departstation = "南港"
    @State private var arrivestation = "嘉義"
    @State private var showHSR = false
    @State private var traveldate = Date()
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.string(from: Date())
        return dateFormatter
    }()
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("查詢日期")
                    DatePicker("日期", selection: $traveldate, in: ...Date(), displayedComponents: .date)
                        .frame(width: 400, height: 150)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                    Text(dateFormatter.string(from: traveldate))
                        .padding(30)
                    HStack {
                        VStack {
                            Text("起站")
                                .frame(width: 50, height: 50)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 5))
                                .padding()
                            NavigationLink(destination: StationList()) {
                                Text(departstation)
                                    .frame(width: 140, height: 140)
                                    .padding(10)
                                    .foregroundColor(Color.white)
                                    .background(Color.green)
                                    .cornerRadius(30)
                            }
                        }
                        Image(systemName: "arrow.right.arrow.left")
                            .frame(width: 60, height: 200)
                            .offset(x: 0, y: 30)
                            .onTapGesture {
                                (self.departstation, self.arrivestation) = (self.arrivestation, self.departstation)
                        }
                        VStack {
                            Text("到站")
                                .frame(width: 50, height: 50)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 5))
                                .padding()
                            NavigationLink(destination: StationList()) {
                                Text(arrivestation)
                                    .frame(width: 140, height: 140)
                                    .padding(10)
                                    .foregroundColor(Color.white)
                                    .background(Color.green)
                                    .cornerRadius(30)
                            }
                        }
                    }
                    
                    Button(action: {self.showHSR = true}){
                        Text("查詢結果")
                            .frame(width: 80, height: 50)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }.sheet(isPresented: self.$showHSR) {
                        HSRList(traveldate: self.$traveldate)
                    }
                    
                }
                .navigationBarTitle("高鐵時刻表查詢")
            }
            .background(Image("train").resizable().opacity(0.3))
        }
    }
}

struct SelectStation_Previews: PreviewProvider {
    static var previews: some View {
        SelectStation()
    }
}
