//
//  GroupRowView.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import SwiftUI

struct GroupRowView: View {
    
    var name: String
    var content: String
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                Text(content).foregroundColor(Color.gray)
            }
        }
    }
}

struct GroupRowView_Previews: PreviewProvider {
    static var previews: some View {
        GroupRowView(name: "Developer", content: "Zainal Iqbal")
            .fixedSize()
    }
}
