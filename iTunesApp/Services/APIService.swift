//
//  APIService.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import Foundation

final class APIService {
    
    func feachAlbums(for searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<AlbumResults, APIError>) -> ()) {
        let url = createURL(for: searchTerm, page: page, limit: limit)
        feth(type: AlbumResults.self, url: url, completion: completion)
    }
    
    func feachAlbum(for albumID: Int, completion: @escaping (Result<AlbumResults, APIError>) -> ()){
        let url = createURL(for: albumID, type: .album)
        feth(type: AlbumResults.self, url: url, completion: completion)
    }
    
    func feachSongs(for albumID: Int, completion: @escaping (Result<SongResults, APIError>) -> ()){
        let url = createURL(for: albumID)
        feth(type: SongResults.self, url: url, completion: completion)
    }
    
    func feachSongs(for searchTerm: String, page: Int, limit: Int, completion: @escaping (Result<SongResults, APIError>) -> ()) {
        let url = createURL(for: searchTerm, page: page, limit: limit, type: .song)
        feth(type: SongResults.self, url: url, completion: completion)
    }
    
    func feachMovie(for searchTerm: String, completion: @escaping (Result<MovieResults, APIError>) -> ()) {
        let url = createURL(for: searchTerm, type: .movie)
        feth(type: MovieResults.self, url: url, completion: completion)
    }
    
    func feachTrends(count: Int, completion: @escaping (Result<TrendsResult, APIError>) -> ()) {
        let url = createTrendsURL(count: count)
        feth(type: TrendsResult.self, url: url, completion: completion)
    }
    
    func feth<T: Decodable>(type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> ()) {
        
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error as? URLError {
                completion(Result.failure(APIError.urlSession(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(response.statusCode)))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.decoding(error as? DecodingError)))
                }
            }
        }.resume()
    }
    
    func createURL(for searchTerm: String, page: Int? = nil, limit: Int? = nil, type: EntityType = .album) -> URL?{
        let baseURL = "https://itunes.apple.com/search"
        
        var queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: type.rawValue),
        ]
        
        if let page = page, let limit = limit {
            queryItems.append(contentsOf: [
                URLQueryItem(name: "limit", value: String(limit)),
                URLQueryItem(name: "offset", value: String(page))
            ])
        }
        
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
    
    func createURL(for id: Int, type: EntityType = .song) -> URL?{
        let baseURL = "https://itunes.apple.com/lookup"
        
        let queryItems = [
            URLQueryItem(name: "id", value: String(id)),
            URLQueryItem(name: "entity", value: type.rawValue),
        ]
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
    
    func createTrendsURL(count: Int) -> URL?{
        return URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/\(count)/songs.js")
    }
}
