//
//  GameDetailView.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import SwiftUI

struct GameDetailView: View {
    
    let gameDetailVM: GameDetailViewModel
   
    @State var isFavorite: Bool
    
    var action: () -> Void
    
    let screenSize = UIScreen.main.bounds.size
    
    func isGenreLast(_ genre: Genre) -> Bool {
        let genreCount = gameDetailVM.genres.count

        if let index = gameDetailVM.genres.firstIndex(of: genre) {
            if index + 1 != genreCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    AsyncImage(url: URL(string: gameDetailVM.backgroundImage)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: screenSize.width, height: screenSize.height/3)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        Image(systemName: "photo.circle.fill")
                            .resizable()
                            .foregroundColor(Color.accentColor)
                            .scaledToFit()
                            .frame(width: screenSize.width, height: screenSize.height/3)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .opacity(0.5)
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(gameDetailVM.name)
                                .foregroundColor(Color.accentColor)
                                .font(.title2)
                                .padding(.vertical, 5)
                            
                            HStack {
                                ForEach(0..<gameDetailVM.genres.count,  id: \.self) { index in
                                    HStack {
                                        Text(gameDetailVM.genres[index].name )
                                            .font(.footnote)
                                        if !isGenreLast(gameDetailVM.genres[index]) {
                                            Image(systemName: "circle.fill")
                                                .foregroundColor(Color.accentColor)
                                                .font(.system(size: 8))
                                        }
                                    }
                                }
                            }
                            HStack {
                                Text(gameDetailVM.released)
                                    .font(.subheadline)
                                Text("|")
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 12))
                                Text(String(gameDetailVM.rating))
                                    .font(.subheadline)
                            }
                        }
                        Spacer()
                        
                        Button {
                            isFavorite.toggle()
                            action()
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(isFavorite ? .red : .white)
                                .font(.system(size: 50))
                                .padding(.trailing, 20)
                        }

                        
                    }
                                        
                    Text(gameDetailVM.details)
                        .font(.footnote)
                    
                    GroupBox(label:
                                HStack {
                        Text(gameDetailVM.name)
                            .fontWeight(.black)
                            .foregroundColor(Color.orange)
                        Spacer()
                        Image(systemName: "apps.iphone")
                            .background(Color.orange)
                    })
                    {
                        GroupRowView(name: "Developer", content: gameDetailVM.nameDev)
                        GroupRowView(name: "Publisher", content: gameDetailVM.namePublish)
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
            .foregroundColor(.white)
            }
        }
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameDetailVM: GameDetailViewModel(gamesDetails: globalParams.sampleDetailGame), isFavorite: false, action: {})
        
    }
}
