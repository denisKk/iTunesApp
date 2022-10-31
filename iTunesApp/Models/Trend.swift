//
//  Trend.swift
//  iTunesApp
//
//  Created by Dev on 29.09.22.
//

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
}

// MARK: - AdamAttributes
struct AdamAttributes: Codable {
    let name: String
//    let albumName: String
//    let artistName: String
}

typealias TrendsResult = [TrendsResultElement]
