//
//  AFHTTP.swift
//  ForNetworking
//
//  Created by Samandar on 09/07/24.
//
import Foundation
import Alamofire


private let is_tester: Bool = true

private let testServer: String = "https://jsonplaceholder.typicode.com/"
private let realServer: String = "https://jsonplaceholder.typicode.com/"

let headers: HTTPHeaders = [
   // "Accept": "a p lication/json" //I write only 1 p instead of 2
    
    
    "accept": "application/json"
]


class AFHTTP {
    
    
    //MARK: AFHttp Requests
    
    class func get(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .get, parameters: params, headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func post(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url),method: .post, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func put(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url),method: .put, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func delete(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url),method: .delete, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    
    //MARK: AFHttp Methods
    
    class func server(url: String) -> URL {
        return URL(string: (is_tester ? testServer : realServer) + url) ?? URL(string: "https://jsonplaceholder.typicode.com/")!
    }
    
    //MARK: AFHttp APIs
    
    static let api_post_list: String = "posts"
    static let api_post_single: String = "posts/" //id
    static let api_post_create: String = "posts"
    static let api_post_update: String = "posts/" //id
    static let api_post_delete: String = "posts/" //id
    
    
    //MARK: AFHttp Params
     
    class func paramEmpty() -> Parameters {
        let parametres: Parameters = [:]
        return parametres
    }
    
    class func paramPostCreate(post: PostF) -> Parameters{
        let parametres: Parameters =
        [
            "title": post.title ?? "",
            "body": post.body ?? "",
            "userId": post.userId ?? 1,
            "id": post.id ?? 1
        ]
        
        return parametres
    }
    
    class func paramPostUpdate(post: PostF) -> Parameters{
        let parametres: Parameters =
        [
            "title": post.title ?? "",
            "body": post.body ?? "",
            "userId": post.userId ?? 1,
            "id": post.id ?? 1
        ]
        
        
        return parametres
    }
    
}
