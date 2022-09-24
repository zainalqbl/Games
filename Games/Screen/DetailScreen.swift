//
//  DetailScreen.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import SwiftUI
import UIKit

struct DetailScreen: View {
    
    let gameId: String
    @ObservedObject var gameDetailVM = GameDetailViewModel()
    
    @State var showsAlert = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                if gameDetailVM.loadingState == .success {
                    GameDetailView(gameDetailVM: gameDetailVM, isFavorite: gameDetailVM.isFavorite, action: {
                        self.showsAlert.toggle()
                        gameDetailVM.checkDataEksis(id: Int(gameId)!)
                        if gameDetailVM.isFavorite {
                            gameDetailVM.deteleFavorite(id: Int(gameId)!)
                        } else {
                            gameDetailVM.savedGame(gamesDetail: gameDetailVM.games!)
                        }
                    })
                    .padding(.top, 5)
                } else if gameDetailVM.loadingState == .loading {
                    SpinningView()
                } else if gameDetailVM.loadingState == .failed {
                    ErrorView()
                }
                Spacer()
                    .alert(isPresented: self.$showsAlert) {
                        Alert(title: Text(gameDetailVM.getMessageAlert()))
                    }
            }
            .onAppear {
                
                self.gameDetailVM.getDetailsGame(id: self.gameId)
                UINavigationBarAppearance()
                    .setColor(title: .orange, background: .black)
            }
            .navigationTitle(gameDetailVM.name)
        }
        .background(Color.black)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(gameId: "3498", gameDetailVM: GameDetailViewModel(gamesDetails: globalParams.sampleDetailGame))
    }
}
