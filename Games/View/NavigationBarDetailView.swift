//
//  NavigationBarDetailView.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import SwiftUI

struct NavigationBarDetailView: View {
    
    var title: String
    
    var action: () -> Void
    
    var showBack: Bool = true
    
    var body: some View {
        HStack {
            if showBack {
                Button(action: {action()}) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            Text(title)
                .font(.title3)
                .fontWeight(.heavy)
            
            Spacer()
        }
        .foregroundColor(.white)
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView(title: "GTA V", action: {}, showBack: true)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
