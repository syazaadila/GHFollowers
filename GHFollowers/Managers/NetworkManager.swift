//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by ansible on 26/01/2024.
//

import UIKit

class NetworkManager{
    //every network manager have static
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    let decoder = JSONDecoder()
    
    //private init can only be called here
    private init(){
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    //    //custom error GFError
    //    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower],GFError>)-> Void) {
    //
    //        //start of network calls
    //        //string interpolation
    //        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
    //
    //        //create url object from above string
    //        guard let url = URL(string: endpoint) else {
    //            completed(.failure(.invalidUsername))
    //            return
    //        }
    //
    //        //handles the 3 var data,response,error
    //        //native way for network calls
    //        //GET request , data is the JSON, response = response code = 404,200
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //
    //            //if error exist
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            //response code
    //            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            guard let data = data else{
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //
    //            //convert JSON into github user object
    //            do {
    //                //decoder taking data from server & decode into our objects
    //                //built in conversion to camelCase
    //                let decoder = JSONDecoder()
    //                decoder.keyDecodingStrategy = .convertFromSnakeCase
    //                //from: data is from url session from line 36
    //                let followers = try decoder.decode([Follower].self, from: data)
    //                completed(.success(followers))
    //            }catch{ //fail to decode throw the invalidData error
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //        //kickoff the API, start the network calls
    //        task.resume()
    //    }
    
    //custom error GFError
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        
        //start of network calls
        //string interpolation
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        //create url object from above string
        guard let url = URL(string: endpoint) else {
            throw GFError.invalidUsername
        }
        
        //handles the 3 var data,response,error
        //native way for network calls
        //GET request , data is the JSON, response = response code = 404,200
        let (data,response) = try await URLSession.shared.data(from: url)
        
        //response code
        guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        
        //convert JSON into github user object
        do {
            //from: data is from url session from line 36
            return try decoder.decode([Follower].self, from: data)
        } catch { //fail to decode throw the invalidData error
            throw GFError.invalidData
        }
    }
    
    //custom error GFError
    func getUserInfo(for username: String) async throws -> User {
        
        //start of network calls
        //string interpolation
        let endpoint = baseURL + "\(username)"
        
        //create url object from above string
        guard let url = URL(string: endpoint) else {
            throw GFError.invalidUsername
        }
        
        //handles the 3 var data,response,error
        //native way for network calls
        //GET request , data is the JSON, response = response code = 404,200
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //response code
        guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        
        //convert JSON into github user object
        do {
            //from: data is from url session from line 36
            return try decoder.decode(User.self, from: data)
        } catch { //fail to decode throw the invalidData error
            throw GFError.invalidData
        }
    }
    
    func downloadImage(from urlString: String) async -> UIImage? {
        let cachekey = NSString(string: urlString)
        if let image = cache.object(forKey: cachekey){ return image}
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cachekey)
            return image
        } catch {
            return nil
        }
    }
}
