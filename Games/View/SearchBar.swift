//
//  SearchBar.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding  var text: String
    
    @State private var isEditing = false
    
    var action: () -> Void
        
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: isEditing ? 270 : 350, height: 36)
                .cornerRadius(8)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .disableAutocorrection(true)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(7)
                    .padding(.leading, -7)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        isEditing = true
                    }
                    .onSubmit {
                        action()
                    }
                
                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.graySearchText)
                            .frame(width: 35, height: 35)
                    }
                    .padding(.trailing, 18)
                }
                
                if isEditing {
                    Button {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    } label: {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    
                }
            }
        }
        .animation(.easeInOut, value: isEditing)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), action: { })
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
