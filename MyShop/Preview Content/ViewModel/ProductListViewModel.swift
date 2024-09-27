//
//  ProductListViewModel.swift
//  MyShop
//
//  Created by LUIS GONZALEZ on 26/09/24.
//

import Foundation


@MainActor
class ProductListViewModel : ObservableObject {
    @Published var product : [ProductViewModel] = []
    
    let webservice: WebService
    
    init( webservice: WebService) {
        self.webservice = webservice
    }
    
    func popularProducts() async { // extaer los productos que viene del webservice 
        do {
            let products  = try await webservice.getProducts()
            self.product = products.map(ProductViewModel.init)
        } catch  {
            print("Error \(error.localizedDescription)")
        }
    }
}

