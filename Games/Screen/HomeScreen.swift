//
//  HomeScreen.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import SwiftUI

struct HomeScreen: View {
        
    @ObservedObject private var gameItemVM: GameItemViewModel
    
    @State private var searchText = ""
    @State private var gameID: String = ""
    
    
    init() {
        self.gameItemVM = GameItemViewModel()
        
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                
                SearchBar(text: $searchText) {
                    print(searchText.trimmedAndEscaped())
                    self.gameItemVM.searchGame(search: searchText)
                }
                .padding()
                .background(.black)
                
                if gameItemVM.loadingState == .success {
                    GameListItem(games: gameItemVM.games)
                } else if gameItemVM.loadingState == .loading {
                    SpinningView()
                } else if gameItemVM.loadingState == .failed {
                    ErrorView()
                }
                
            }
            .onAppear {
                print("Game Count \(gameItemVM.games.count)")
                if gameItemVM.games.count < 1 {
                    self.gameItemVM.getGamesPopular()                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        NavigationBarHomeView(action: {})
                    }
                }
            }
        }
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
