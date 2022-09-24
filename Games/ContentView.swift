//
//  ContentView.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var selectedItem = 0
    
    init() {
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedItem) {
                HomeScreen()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                FavoriteScreen()
                    .tabItem {
                        Image(systemName: "folder.fill.badge.plus")
                        Text("Favorite")
                    }.tag(1)
                
                ProfileScreen()
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Profile")
                    }.tag(2)
            }
            .background(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
