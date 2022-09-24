//
//  ErrorView.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack(alignment: .center) {
                Spacer()
                Image(systemName: "exclamationmark.square.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.red)
                
                Text("Error !")
                    .font(.system(size: 24))
                    .bold()
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
        
    }
}
