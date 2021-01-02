//
//  MiniPlayer.swift
//  Apple Music Animation
//
//  Created by 中筋淳朗 on 2020/11/22.
//

import SwiftUI

struct MiniPlayer: View {
    
    // MARK: - Property
    
    @Binding var expand: Bool
    
    var animation: Namespace.ID
    
    var bigImageSize = UIScreen.main.bounds.height / 3
    
    @State var sliderValue = 0.7
    
    @State var dragOffset: CGFloat = 0
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - デフォルト + 拡大時の画像
            HStack (spacing: 15) {
                
                // expand 時に画像を中心に持ってくる
                if expand {
                    Spacer()
                } //: if
                
                Image("pic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: expand ? bigImageSize : 55, height: expand ? bigImageSize : 55)
                    .cornerRadius(15)
                    .padding(.top, expand ? 50 : 0)
                
                if !expand {
                    Text("4s4ki")
                        .font(.title2)
                        .fontWeight(.medium)
                        .matchedGeometryEffect(id: "Artist", in: animation)
                } //: if
                
                Spacer()
                
                if !expand {
                    HStack (spacing: 16) {
                        Button(action: {}, label: {
                            Image(systemName: "play.fill")
                        }) //: Button
                        
                        Button(action: {}, label: {
                            Image(systemName: "forward.fill")
                        }) //: Button
                    } //: HStack
                    .foregroundColor(.black)
                    .font(.title2)
                } //: if

            } //: HStack
            .padding(.horizontal)
            
            // MARK: - 拡大時の画像より下の部分
            if expand {
                VStack {
                    Text("4s4ki")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black.opacity(0.9))
                        .padding(.top, 80)
                        .matchedGeometryEffect(id: "Artist", in: animation)
                    
                    HStack (spacing: 50) {
                        Button(action: {}, label: {
                            Image(systemName: "backward.fill")
                        }) //: Button
                        
                        Button(action: {}, label: {
                            Image(systemName: "play.fill")
                        }) //: Button
                        .font(.system(size: 60))
                        
                        Button(action: {}, label: {
                            Image(systemName: "forward.fill")
                        }) //: Button
                    } //: HStack
                    .foregroundColor(Color.black.opacity(0.9))
                    .font(.system(size: 40))
                    .padding(.top, 50)
                    
                    HStack (spacing: 18) {
                        Image(systemName: "speaker.fill")
                            .font(.system(size: 14))
                        
                        Slider(value: $sliderValue, in: 0...1)
                        
                        Image(systemName: "speaker.wave.3.fill")
                            .font(.system(size: 14))
                    } //: HStack
                    .padding(.horizontal, 50)
                    .padding(.top, 90)
                } //: VStack
            } //: if
            
        } //: VStack
        .frame(maxHeight: expand ? .infinity : 80)
        // background に作ったBlurをかける
        .background(
            VStack (spacing: 0) {
                BlurView()
                Divider()
            } //: VStack
            .onTapGesture(perform: {
                withAnimation(.easeOut) {
                    expand.toggle()
                }
            })
        )
        .cornerRadius(expand ? 30 : 0)
        .ignoresSafeArea()
        .offset(y: expand ? 0 : -48)
        .offset(y: dragOffset)
        // drag gesture
        .gesture(
            DragGesture()
                .onChanged({ value in
                    onChanged(value: value)
                })
                .onEnded({ value in
                    onEnded(value: value)
                })
        ) //: gesture
    }
    
    
    // MARK: - Function
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height >= 0 && expand {
            dragOffset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.height > UIScreen.main.bounds.height * 0.3 {
                expand.toggle()
                dragOffset = 0
            } else {
                dragOffset = 0
            }
        }
    }
}

// MARK: - Preview

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
