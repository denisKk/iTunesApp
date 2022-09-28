//
//  SongSectionView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct SongSectionView: View {
    let songs: [Song]
    let rows = Array(repeating: GridItem(.fixed(60)), count: 4)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(songs){ song in
                    
                    HStack{
                       SongRowView(song: song)
                            .frame(width: 300)
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
