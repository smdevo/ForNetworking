//
//  MainNView.swift
//  ForNetworking
//
//  Created by Samandar on 09/07/24.
//

import SwiftUI
import Alamofire

struct MainNView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                //gettingApiPostList() //With way of teacher
                //gettingApiPostListUsingAFonly() // with only Alamofire
                
                //gettingSingliPost(id: 2)
                
               // creatingNewPost(post: PostF(title: "About Samandar", body: "Samandar Toshpulatov, 22 years old, IOS Developer"))
                //creatingNewPostonlyAF(post: PostF(title: "Akbarjon", body: "Akbarjon is good developer and smart also"))
                
                //updatingPost(post: PostF(title: "Sardorbek", body: "Sardorbek is also good developer"), id: 2)
                updatePostUsingOnlyAF(post: PostF(title: "Humoyun", body: "Humoyun is Senior Developer"), id: 1)
                
            }//onAppear
    }//body
    
    
    
    
    //MARK: Methods Requests
    
    
    
    //MARK: Using AFHTTP class that we created before
    
    
    //Getting list
    func gettingApiPostList() {
        
        AFHTTP.get(url: AFHTTP.api_post_list, params: AFHTTP.paramEmpty()) { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
            
        }
        
    }//gettingApiPostList
    
    
    //getting single post
    
    func gettingSingliPost(id: Int?) {
        
        AFHTTP.get(url: AFHTTP.api_post_single + String(id ?? 1), params: AFHTTP.paramEmpty()) { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        }
        
    }//gettingSingliPost
    
    
    
    //creating new post
    
    func creatingNewPost(post: PostF) {
        
        AFHTTP.post(url: AFHTTP.api_post_create, params: AFHTTP.paramPostCreate(post: post)) { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
            
        }
        
    }//creatingNewPost
    
    
    //updating post
    func  updatingPost(post: PostF, id: Int) {
        AFHTTP.put(url: AFHTTP.api_post_update + String(id), params: AFHTTP.paramPostUpdate(post: post)) { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
            
        }
    }//updatingPost
        
        
        // MARK: Using only Alamofire
    
    //getting all list
        func gettingApiPostListUsingAFonly() {
            
            AF.request("https://jsonplaceholder.typicode.com/posts", method: .get, parameters: [:], headers: ["accept":"application/json"]).validate().responseJSON { response in
                
                switch response.result {
                case .success:
                    print(response.result)
                case let .failure(error):
                    print(error)
                }
                
            }
            
        }//gettingApiPostListUsingAFonly
    
     
    func creatingNewPostonlyAF(post: PostF) {
        
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .post, parameters: [
            "id": post.id ?? 1,
            "userId": post.userId ?? 1,
            "title": post.title ?? "",
            "body": post.body ?? ""
        ], headers: ["accept":"application/json"]).validate().responseJSON { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
            
        }
        
    }//creatingNewPostonlyAF
    

    func updatePostUsingOnlyAF(post: PostF, id: Int) {
        AF.request("https://jsonplaceholder.typicode.com/posts/" + String(id), method: .put, parameters: [
            "id": post.id ?? 1,
            "userId": post.userId ?? 1,
            "title": post.title ?? "",
            "body": post.body ?? ""
        ], headers: ["accept":"application/json"]).validate().responseJSON { response in
           
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
            
        }
    }//updatePostUsingOnlyAF
    
    
    
    }//MainNView


struct MainNView_Previews: PreviewProvider {
    static var previews: some View {
        MainNView()
    }
}



