//
//  SongSectionView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct SongSectionView: View {
    let songs: [Song]
    let rows = Array(repeating: GridItem(.fixed(60), spacing: 0), count: 4)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(songs){ song in
                    
                    HStack{
                        NavigationLink {
                            SongDetailView(song: song)
                        } label: {
                            SongRowView(song: song)
                                .frame(width: 290)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

struct SongSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SongSectionView(songs: Array(repeating: Song.example(), count: 10))
    }
}
