//
//  ProfileScreen.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import SwiftUI

struct ProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            ScrollView {
                
                NavigationBarDetailView(title: "Profile", action: {}, showBack: false)
                .padding(.horizontal, 15)
                .padding(.top, UIApplication
                                        .shared
                                        .connectedScenes
                                        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                        .first { $0.isKeyWindow }?.safeAreaInsets.top)
                .padding(.bottom, 60)
                
                
                GroupBox(
                    label:
                        HStack {
                            Text("Profile")
                                .fontWeight(.black)
                            Spacer()
                            Image(systemName: "info.circle")})
                {
                    Divider().padding(.vertical, 4)
                    
                    HStack(alignment: .center, spacing: 10) {
                      Image("Profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .frame(width: 90, height: 130)
                      
                        VStack(alignment: .leading) {
                            Text("Zainal Iqbal")
                                  .fontWeight(.black)
                            Text("zainalabqi@gmail.com")
                                .foregroundColor(Color.graySearchText)
                                .fontWeight(.heavy)
                                
                        }
                        Spacer()
                    }
                }
                
                GroupBox(
                    label:
                        HStack {
                            Text("Appliaction")
                                .fontWeight(.black)
                            Spacer()
                            Image(systemName: "apps.iphone")})
                {
                    GroupRowView(name: "Developer", content: "Zainal Iqbal")
                    GroupRowView(name: "Compatibility", content: "IOS 15.5")
                    GroupRowView(name: "Version", content: "1.0")
                    GroupRowView(name: "", content: "Belajar Fundamental Aplikasi IOS")
                }
                
                Spacer()
                
            }
            .foregroundColor(.graySearchBackground)
            .ignoresSafeArea(.all)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}


