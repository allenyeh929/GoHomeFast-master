//
//  ContentView.swift
//  GoHomeFast
//
//  Created by Allen on 2023/1/3.
//  Copyright © 2023 Allen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var photoData: PhotoData
    var body: some View {
        TabView{
            SelectStation()
                .tabItem {
                    Image(systemName: "location.fill")
                    Text("選擇車站")
            }
            Website()
                .tabItem {
                    Image(systemName: "hare.fill")
                    Text("高鐵網站")
                }
            Author()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("貴人")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
