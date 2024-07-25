//
//  NetworkManager.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//
import Foundation

enum RequestTypes {
    case random
    case categorySearch(String)
    case allCategories
    case query(String)
}

enum NetworkError: Error {
    case BadURL
    case NoData
    case DecodingError
    case RequestFailed(Error)
}

class NetworkManager<T: Codable> {
    var requestType: RequestTypes
    
    var urlString: String {
        switch requestType {
        case .random:
            return "https://api.chucknorris.io/jokes/random"
        case .categorySearch(let categoryString):
            return "https://api.chucknorris.io/jokes/random?category=\(categoryString)"
        case .allCategories:
            return "https://api.chucknorris.io/jokes/categories"
        case .query(let queryString):
            return "https://api.chucknorris.io/jokes/search?query=\(queryString)"
        }
    }
    
    init(requestType: RequestTypes) {
        self.requestType = requestType
    }
    
    func makeRequest(completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.BadURL))
            return
        }
        
        print(url)
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.RequestFailed(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.NoData))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.DecodingError))
            }
        }
        .resume()
    }
}
