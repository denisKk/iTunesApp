//
//  FetchState.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import Foundation


enum FetchState: Comparable {
    case start
    case isLoading
    case loadedAll
    case error(String)
}
