//
//  ImageLoadingView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct ImageLoadingView: View {
    
    let urlString: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)){ image in
            image
                .resizable()
                .border(Color(white: 0.2))
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
    }
}


struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingView(urlString: "", size: 60)
    }
}
