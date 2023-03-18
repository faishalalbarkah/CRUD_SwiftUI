//
//  ViewModel.swift
//  CRUD_SwiftUI
//
//  Created by faisalalbarkah on 14/11/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [PostModel]()
    let prefixUrl = "http://localhost:3000"
    
    init() {
        fetchPosts()
    }
    
    //Mark = retrieve Data
    func fetchPosts() {
        guard let url = URL(string: "\(prefixUrl)/posts") else {
            print("Not Found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No Data!")
                }
            } catch let JsonError {
                print("Fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    //Mark = Create Data
    func createPosts(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/createPost") else {
            print("Not Found")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No Data!")
                }
            } catch let JsonError {
                print("Fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    //Mark = Update Data
    func updatePosts(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/updatePost") else {
            print("Not Found")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No Data!")
                }
            } catch let JsonError {
                print("Fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    //Mark = Delete Data
    func deletePost(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/deletePost") else {
            print("Not Found")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No Data!")
                }
            } catch let JsonError {
                print("Fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
}
