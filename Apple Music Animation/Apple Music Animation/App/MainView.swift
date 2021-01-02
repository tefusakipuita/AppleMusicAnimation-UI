//
//  MainView.swift
//  Apple Music Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Property
    
    @State var selected = 0
    
    @State var expand = false
    
    @Namespace var animation
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .bottom) {
            
            // MARK: - Main Tab
            TabView (selection: $selected) {
                ContentView()
                    .tag(0)
                    .tabItem {
                        Image(systemName: "music.quarternote.3")
                    }
                Text("Second")
                    .tag(1)
                    .tabItem {
                        Image(systemName: "cart.fill.badge.plus")
                    }
                Text("Third")
                    .tag(2)
                    .tabItem {
                        Image(systemName: "tv.music.note.fill")
                    }
            }//: TabView
            
            
            // MARK: - Mini Music Player
            MiniPlayer(expand: $expand, animation: animation)
            
        } //: ZStack
    }
}

// MARK: - Preview

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
