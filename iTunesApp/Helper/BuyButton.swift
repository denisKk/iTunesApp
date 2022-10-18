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
            else {
                Text("album only".localizedUppercase)
                    .font(.caption)
                    .foregroundColor(.fontPrimary)
                    
            }
        }
    }
        
    
    
func formattedPrice() -> String? {
        
        guard let price = price, price > 0 else {
            return nil
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
        ZStack{
            let example = Song.example()
            BuyButton(price: example.trackPrice, currency: example.currency, urlString: example.previewURL)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
    }
}
