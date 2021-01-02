//
//  ContentView.swift
//  Apple Music Animation
//
//  Created by 中筋淳朗 on 2020/11/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var albumWidth = (UIScreen.main.bounds.width - 30) / 2
    
    
    // MARK: - Body
    
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading) {
                
                // MARK: - Top
                Text("ライブラリ")
                    .font(.system(size: 30, weight: .black))
                    .padding(.top, 60)
                
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .frame(height: 0.5)
                
                HStack {
                    Image(systemName: "music.note.list")
                        .foregroundColor(.pink)
                    Text("プレイリスト")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.black.opacity(0.3))
                } //: HStack
                .font(.system(size: 20))
                .padding(.vertical, 8)
                .padding(.trailing, 10)
                
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .frame(height: 0.5)
                    .padding(.bottom, 40)
                
                // MARK: - Album
                LazyVGrid (columns: columns) {
                    ForEach(0..<10) { i in
                        Image("m\(i + 1)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: albumWidth, height: albumWidth)
                            .cornerRadius(10)
                    } //: ForEach
                } //: VGrid
                
                Spacer()
            } //: VStack
            .foregroundColor(Color.black.opacity(0.9))
            .padding(.horizontal, 10)
            .padding(.bottom, 80)
        } //: Scroll
        
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
