//
//  BookModel.swift
//  SimpleShopApp
//
//  Created by Krzysztof Lema on 08.02.2018.
//  Copyright © 2018 Krzysztof Lema. All rights reserved.
//

class BookModel{
    var title:String
    var author:String
    var image:String
    var price:Double
    var description:String
    
    init(title:String,author:String,image:String,price:Double,description:String) {
        self.title = title
        self.author = author
        self.image = image
        self.price = price
        self.description = description
    }
    convenience init() {
        self.init(title: "", author: "", image: "", price: 0,description: "")
    }
}
