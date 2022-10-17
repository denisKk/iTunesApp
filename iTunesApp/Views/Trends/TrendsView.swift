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
            
            switch trendsViewModel.state {
            case .error(let message):
                Text(message.description)
                    .foregroundColor(.red)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .top)
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
            default:
                pupularsList()
            }
        }
        .onAppear{
            trendsViewModel.feachTrends()
        }
        .frame(maxHeight: .infinity)
    }
    
    @ViewBuilder
    func pupularsList() -> some View {
        Text("Popular")
            .font(.title2)
            .foregroundColor(.fontPrimary)
        
        ForEach(trendsViewModel.trends){ adam in
            
            let name = adam.attributes.name
            
            Button {
                searchTerm = name
            } label: {
                Text(name)
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView(searchTerm: .constant(""))
            .background(Color.bg)
    }
}
