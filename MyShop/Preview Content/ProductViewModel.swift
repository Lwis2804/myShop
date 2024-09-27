//
//  ProductViewModel.swift
//  MyShop
//
//  Created by LUIS GONZALEZ on 26/09/24.
//

import Foundation

// datos expliocitos a extraer 

struct ProductViewModel: Identifiable {
    private var product : Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id:  Int{
        product.id
    }
    
    var title: String{
        product.title
    }
    
    var price: Double {
        product.price
    }
    
    var image: String {
        product.image
    }
    
    var description: String {
        product.description
    }
    
    
}
