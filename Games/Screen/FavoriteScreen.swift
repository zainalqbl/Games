//
//  FavoriteScreen.swift
//  Games
//
//  Created by HIS nutech on 15/09/22.
//

import SwiftUI
import UIKit

struct FavoriteScreen: View {
    
    @ObservedObject private var gameItemVM: GameFavoriteViewModel
    
    init() {
        self.gameItemVM = GameFavoriteViewModel()
        
    }
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 0) {
                
                SearchBar(text: $gameItemVM.search) {
                    print(gameItemVM.search.trimmedAndEscaped())
                }
                .padding()
                .background(.black)
                
                Spacer()
                
                if gameItemVM.games.count != 0 {
                    GameListItem(games: gameItemVM.filterGame())
                } else {
                    Text("Belum ada Favorite Game")
                        .foregroundColor(Color.orange)
                }
                Spacer()
            }
            .background(.black)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        NavigationBarDetailView(title: "Favorite".uppercased(), action: {}, showBack: false)
                    }
                }
            }
            .foregroundColor(Color.accentColor)
            .onAppear {
                self.gameItemVM.getSavedGames()
            }
        }
        
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
