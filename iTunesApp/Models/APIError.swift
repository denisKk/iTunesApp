//
//  APIError.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    
    
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "badURL"
        case .urlSession(let error):
            return "URLSession error: \(error.debugDescription)"
        case .badResponse(let statusCode):
            return "Bad response with status code: \(statusCode)"
        case .decoding(let decodingError):
            return "Decoding error: \(String(describing: decodingError))"
        case .unknown:
            return "Unknown error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown, .badResponse(_):
            return "something went wrong"
        case .urlSession(let error):
            return error?.localizedDescription ?? "something went wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "something went wrong"
        }
    }
}
