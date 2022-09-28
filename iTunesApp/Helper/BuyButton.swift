//
//  BuyButton.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct BuyButton: View {
    let price: Double?
    let currency: String
    let urlString: String
    
    var body: some View {
        ZStack{
            if let url = URL(string: urlString), let priceString = formattedPrice() {
                Link(destination: url) {
                    Text(priceString)
                }
                .buttonStyle(BuyButtonStyle())
            }
        }
    }
    
    func formattedPrice() -> String? {
        
        guard let price = price else {
            return ""
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        let priceString = formatter.string(from: NSNumber(value: price))
        return priceString
    }
}
struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        let example = Song.example()
        BuyButton(price: example.trackPrice, currency: example.currency, urlString: example.previewURL)
    }
}
