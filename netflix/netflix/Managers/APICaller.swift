//
//  APICaller.swift
//  netflix
//
//  Created by Nirmal Koirala on 05/07/2022.
//

import Foundation

struct constants{
    
    static let API_KEY = "858541ce6e8959ac79114cbdb4aeef6e"
    static let baseURL = "https://api.themoviedb.org/"
    static let youtubeAPI_KEY = "AIzaSyAoXdG2-mKSvUYaHwQjhg-juXBg2pTZZ4o"
    static let youtubebaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}
 
enum APIError: Error {
    case failedtogetdata
}
 


class APICaller {
    static let shared =  APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string:"\(constants.baseURL)/3/trending/movie/day?api_key=\(constants.API_KEY)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedtogetdata))
            }
           
            
        }
        
        task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(constants.baseURL)/3/trending/tv/day?api_key=\(constants.API_KEY)") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedtogetdata))
            }
           
            
        }
        
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(constants.baseURL)/3/movie/upcoming?api_key=\(constants.API_KEY)&language=en-US&page=1") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedtogetdata))
            }
           
            
        }
        
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(constants.baseURL)/3/movie/popular?api_key=\(constants.API_KEY)&language=en-US&page=1") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedtogetdata))
            }
           
            
        }
        
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(constants.baseURL)/3/movie/top_rated?api_key=\(constants.API_KEY)&language=en-US&page=1") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedtogetdata))
            }
           
            
        }
        
        task.resume()
    }
    
    func getDiscoverMovie(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(constants.baseURL)/3/discover/movie?api_key=\(constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate)&language=en-US&page=1") else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedtogetdata))
            }
           
            
        }
        
        task.resume()
    }
    
    func search(with query: String,completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) != nil else{
            return
        }
       
        guard let url = URL(string:"\(constants.baseURL)/3/trending/tv/day?api_key=\(constants.API_KEY)") else{
            return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedtogetdata))
            }
           
            
        }
        
        task.resume()
    }
    
    func getMovie(with query: String,completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) != nil else{
            return}
        guard let url = URL(string: "\(constants.youtubebaseURL)q=\(query)&key=\(constants.youtubeAPI_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            do{
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                    if let item = results.item?.first {
                        completion(.success(item))
                    } else {
                        completion(.failure(NSError(domain: "ERROR", code: 404)))
                    }
            }
            catch{
                completion(.failure(error))
                print(error)
            }
           
            
        }
        
        task.resume()
    }
}





