//
//  MusicModel.swift
//  SimpleShopApp
//
//  Created by Krzysztof Lema on 07.03.2018.
//  Copyright © 2018 Krzysztof Lema. All rights reserved.
//

import Foundation
class MusicModel{
    var title:String
    var author:String
    var music:String
    var image:String
    var price:Double
    init(title: String, author: String, music: String, image: String, price: Double) {
        self.title = title
        self.author = author
        self.music = music
        self.image = image
        self.price = price
    }
    convenience init() {
        self.init(title: "", author: "", music: "", image:"", price: 0.0)
    }
}
