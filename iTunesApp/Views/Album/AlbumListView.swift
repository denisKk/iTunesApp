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
        
        ScrollView {
            LazyVStack{
                ForEach(Array(Set(albumListViewModel.albums))) { album in
                    NavigationLink {
                        AlbumDetailView(album: album)
                    } label: {
                        AlbumRowView(album: album)
                    }
                }
                
                switch albumListViewModel.state {
                case .start:
                    if albumListViewModel.albums.count > 0 {
                        Color.clear
                            .onAppear{
                                albumListViewModel.loadMore()
                            }
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
        }
        .padding(.horizontal)
        .background(Color.bg)
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView(albumListViewModel: AlbumListViewModel.example())
    }
}
