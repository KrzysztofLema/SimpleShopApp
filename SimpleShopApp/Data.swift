//
//  Data.swift
//  SimpleShopApp
//
//  Created by Krzysztof Lema on 06.03.2018.
//  Copyright © 2018 Krzysztof Lema. All rights reserved.
//

import Foundation
import RealmSwift
class Data: Object  {
    @objc dynamic var title: String = ""
    @objc dynamic var price: Double = 0
}
