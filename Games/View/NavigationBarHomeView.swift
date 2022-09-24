//
//  NavigationBarHomeView.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import SwiftUI

struct NavigationBarHomeView: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "g.square.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.accentColor)
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("Games".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(Color.accentColor)
            
            Spacer()
            
        }
    }
}

struct NavigationBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarHomeView(action: { })
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
