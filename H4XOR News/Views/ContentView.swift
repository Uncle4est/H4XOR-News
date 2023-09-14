//
//  ContentView.swift
//  H4XOR News
//
//  Created by Nicholas Smith on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(networkManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Image(systemName: "heart")
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
            }
            .navigationTitle("BITCH NEWS")
        }
        .onAppear {
            networkManager.fetchData()
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(Color.blue.opacity(0.3))
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
