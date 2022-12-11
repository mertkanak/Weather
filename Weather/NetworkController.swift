//
//  NetworkController.swift
//  Weather
//
//  Created by mert Kanak on 11.12.2022.
//

import Foundation

struct NetworkController {
    
    /*https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}*/
    
    private static var baseUrl = "api.openweathermap.org"
    private static let apiKey = "95c3222fba15653c665a5e4ea8a58113"
    
    enum Endpoint {
            case cityId(path: String = "/data/2.5/weather", id: Int)
            
            var url: URL? {
                var components = URLComponents()
                
                components.scheme = "https"
                components.host = baseUrl
                components.path = path
                components.queryItems = queryItems
                
                return components.url
            }
            
            private var path: String {
                switch self {
                case .cityId(let path, _):
                    return path
                }
            }
            
            private var queryItems: [URLQueryItem] {
                
                var queryItems = [URLQueryItem]()
                
                switch self {
                case .cityId(_, let id):
                    queryItems.append(URLQueryItem(name: "id", value: String(id)))
                }
                
                queryItems.append(URLQueryItem(name: "appid", value: apiKey))
                
                return queryItems
            }
        }
        
        // 5128581 is New York
        static func fetchWeather(for cityId: Int, _ completion: @escaping ((Weather) -> Void)) {
            if let url = Endpoint.cityId(id: cityId).url {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Whoops, and error occured!", error)
                    }
                    
                    if let data = data {
                        do {
                            let weather = try JSONDecoder().decode(Weather.self, from: data)
                            completion(weather)
                        } catch let error {
                            print("failed to decode object...", error)
                        }
                        
                    }
                }.resume()
            }
        }
}
