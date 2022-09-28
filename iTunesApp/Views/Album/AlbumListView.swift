//
//  AlbumListView.swift
//  iTunes
//
//  Created by Dev on 20.09.22.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    
    var body: some View {
        
        List{
            ForEach(albumListViewModel.albums) { album in
                NavigationLink {
                    AlbumDetailView(album: album)
                } label: {
                    AlbumRowView(album: album)
                }
            }
            
            switch albumListViewModel.state {
            case .start:
                Color.clear
                    .onAppear{
                        albumListViewModel.loadMore()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
                
            default:
                Color.clear
            }
        }
        .listStyle(.plain)
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView(albumListViewModel: AlbumListViewModel())
    }
}
