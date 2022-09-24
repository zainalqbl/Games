//
//  GameListItem.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import SwiftUI

struct GameListItem: View {
    
    let games: [GameViewModel]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            ScrollView {
                LazyVStack {
                    ForEach(self.games, id:\.id) { game in
                        NavigationLink(
                            destination: DetailScreen(gameId: String(game.id))
                        ) {
                            GameItemView(game: game)
                        }
                    }
                }
            }
        }
    }
}

struct GameListItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            GameListItem(games: globalParams.sampleListGame.map(GameViewModel.init))
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
