//
//  Product.swift
//  MyShop
//
//  Created by LUIS GONZALEZ on 26/09/24.
//

import Foundation

struct Product : Decodable {
    let id: Int
    let title : String
    let price : Double
    let image : String
    let description :  String
}
