//
//  NetworkManager.swift
//  HackNewsSwiftUI
//
//  Created by Shubham Mishra on 09/05/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let decodedData = try decoder.decode(Results.self, from: safeData)
                        print(decodedData)
                        DispatchQueue.main.async {
                            self.posts = decodedData.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}
