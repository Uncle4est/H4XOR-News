//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Nicholas Smith on 9/7/23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description for error")
                return
            }
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(Results.self, from: data)
                DispatchQueue.main.async { [unowned self] in
                    posts = results.hits
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
