//
//  iTunesAppApp.swift
//  iTunesApp
//
//  Created by Dev on 20.09.22.
//

import SwiftUI

@main
struct iTunesAppApp: App {
    
    init(){
        UICollectionView.appearance().backgroundColor = .clear
        UICollectionViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
   }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
