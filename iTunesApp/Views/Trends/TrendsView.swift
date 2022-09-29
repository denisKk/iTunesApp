//
//  TrendsView.swift
//  iTunesApp
//
//  Created by Dev on 29.09.22.
//

import SwiftUI

struct TrendsView: View {
    
    @Binding var searchTerm: String
    @StateObject var trendsViewModel = TrendsListViewModel()
    
    var body: some View {
        VStack(spacing: 12){
            ForEach(trendsViewModel.trends){ adam in
                
                let name = adam.attributes.name
                
                Button {
                    searchTerm = name
                } label: {
                    Text(name)
                }
            }
        }
        .onAppear{
            trendsViewModel.feachTrends()
        }
        .frame(maxHeight: .infinity)
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView(searchTerm: .constant(""))
    }
}
