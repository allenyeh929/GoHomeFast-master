//
//  PhotoData.swift
//  finalProject
//
//  Created by Allen on 2023/1/3.
//  Copyright © 2023 Allen. All rights reserved.
//

import Foundation

struct Photo: Codable {
    var id = UUID()
    var placename: String
    var gotoDate: Date
    var favorite: Bool
    var imageName: String
    
    var imagePath: String {
        return PhotoData.documentsDirectory.appendingPathComponent(imageName).path
    }
}

class PhotoData: ObservableObject {

    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    @Published var photos = [Photo]() {
        didSet {
            if let data = try? PropertyListEncoder().encode(photos) {
                let url = PhotoData.documentsDirectory.appendingPathComponent("photos")
                try? data.write(to: url)
            }
        }
    }
    
    init() {
        let url = PhotoData.documentsDirectory.appendingPathComponent("photos")
        if let data = try? Data(contentsOf: url), let array = try?  PropertyListDecoder().decode([Photo].self, from: data) {
            photos = array
        }
    }
    
    
    
}
