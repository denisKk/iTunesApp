//
//  Trend.swift
//  iTunesApp
//
//  Created by Dev on 29.09.22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trendsResult = try? newJSONDecoder().decode(TrendsResult.self, from: jsonData)

import Foundation

// MARK: - TrendsResultElement
struct TrendsResultElement: Codable {
    let chartName, type, chart: String
    let adams: [Adam]

    enum CodingKeys: String, CodingKey {
        case chartName = "chart_name"
        case type, chart, adams
    }
}

// MARK: - Adam
struct Adam: Codable, Identifiable {
    let id: String
    let type, href: String
    let attributes: AdamAttributes
//    let relationships: Relationships
}

// MARK: - AdamAttributes
struct AdamAttributes: Codable {
    let albumName: String
    let hasTimeSyncedLyrics: Bool
    let genreNames: [String]
    let trackNumber: Int
    let releaseDate: String
    let durationInMillis: Int
    let isMasteredForItunes: Bool
    let isrc: String
//    let artwork: Artwork
    let composerName, audioLocale: String
    let url: String
//    let playParams: PlayParams
    let discNumber: Int
    let isAppleDigitalMaster, hasLyrics: Bool
    let audioTraits: [String]
    let name: String
//    let previews: [Preview]
    let artistName: String
    let contentRating: String?
}

//// MARK: - Artwork
//struct Artwork: Codable {
//    let width: Int
//    let url: String
//    let height: Int
//    let textColor3, textColor2, textColor4, textColor1: String
//    let bgColor: String
//    let hasP3: Bool
//}
//
//// MARK: - PlayParams
//struct PlayParams: Codable {
//    let id, kind: String
//}
//
//// MARK: - Preview
//struct Preview: Codable {
//    let url: String
//}
//
//// MARK: - Relationships
//struct Relationships: Codable {
//    let artists: Artists
//    let genres: Genres
//}
//
//// MARK: - Artists
//struct Artists: Codable {
//    let href: String
//    let data: [ArtistsDatum]
//}
//
//// MARK: - ArtistsDatum
//struct ArtistsDatum: Codable {
//    let id, type, href: String
//    let attributes: PurpleAttributes
//}
//
//// MARK: - PurpleAttributes
//struct PurpleAttributes: Codable {
//    let genreNames: [String]
//    let name: String
//    let artwork: Artwork
//    let url: String
//}
//
//// MARK: - Genres
//struct Genres: Codable {
//    let href: String
//    let data: [GenresDatum]
//}
//
//// MARK: - GenresDatum
//struct GenresDatum: Codable {
//    let id: String
//    let type: TypeEnum
//    let href: String
//    let attributes: FluffyAttributes
//}
//
//// MARK: - FluffyAttributes
//struct FluffyAttributes: Codable {
//    let parentName: String?
//    let name: String
//    let parentID: String?
//    let url: String
//
//    enum CodingKeys: String, CodingKey {
//        case parentName, name
//        case parentID = "parentId"
//        case url
//    }
//}
//
//enum TypeEnum: String, Codable {
//    case genres = "genres"
//}

typealias TrendsResult = [TrendsResultElement]
