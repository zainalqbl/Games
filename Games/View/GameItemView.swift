//
//  GameItemView.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import SwiftUI

struct GameItemView: View {
    
    let game: GameViewModel
    
    func isGenreLast(_ genre: Genre) -> Bool {
        let genreCount = game.genres.count
        
        if let index = game.genres.firstIndex(of: genre) {
            if index + 1 != genreCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        HStack(spacing: 0) {
            AsyncImage(url: URL(string: game.backgroundImage)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .foregroundColor(Color.accentColor)
                    .scaledToFit()
                    .frame(width: 130, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(0.5)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(game.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                HStack {
                    ForEach(0..<game.genres.count,  id: \.self) { index in
                        HStack {
                            if index <= 2 {
                                Text(game.genres[index].name)
                                    .font(.footnote)
                                if !isGenreLast(game.genres[index]) {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(Color.accentColor)
                                        .font(.system(size: 8))
                                }
                            }
                        }
                    }
                }
                
                HStack {
                    Text(game.released)
                        .font(.subheadline)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 12))
                    Text(String(game.rating))
                        .font(.subheadline)
                    Spacer()
                    
                }
            }
            .padding()
            .foregroundColor(.white)
            
            Spacer()
        }
    }
}

struct GameItemView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            GameItemView(game: globalParams.sampleListGame.map(GameViewModel.init)[0])
        }
        
    }
}
