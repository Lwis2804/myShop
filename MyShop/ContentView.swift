//
//  ContentView.swift
//  MyShop
//
//  Created by LUIS GONZALEZ on 26/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel =  ProductListViewModel(webservice: WebService())
    
    var body: some View {
        List(viewModel.product) { product in
            HStack {
                AsyncImage(url: URL(string: product.image)) { image  in
                    image.resizable().frame(maxWidth: 120, maxHeight: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                } placeholder: {
                    ProgressView()
                }.padding()
                
                VStack{
                    Text(product.title)
                        .font(.title2)
                        .foregroundColor(.blue)//"%.2f" sirve pera agregar 2 decimales
                    
                    
                    Text("$ \(String(format: "%.2f", product.price))")
                        .foregroundColor(.orange)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(product.description)
                        .font(.footnote)
                }
                
            }
            //.task para poder pintar en pantalla
        } .task {
            await viewModel.popularProducts()
        }
    }
}

#Preview {
    ContentView()
}
