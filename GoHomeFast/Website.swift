//
//  Website.swift
//  finalProject
//
//  Created by Allen on 2023/1/3.
//  Copyright © 2023 Allen. All rights reserved.
//

import SwiftUI

struct Website: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("https://ptx.transportdata.tw/PTX/Service?keyword=高鐵")
                }
                .navigationBarTitle("高鐵網站")
            }
            .background(Image("train").resizable().opacity(0.3))
        }
    }
}

struct Website_Previews: PreviewProvider {
    static var previews: some View {
        Website()
    }
}
