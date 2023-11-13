//
//  ContentView.swift
//  cs193p-App1
//
//  Created by George on 11/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount : Int = 4
    let emojis : Array<String> = ["👽", "😈", "👻", "🎃", "🤡", "💀", "☠️","🧚","👠", "🐶"]
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardControls
    }
        
    }
    func cardController(by offset : Int , symbol : String) -> some View{
        Button(action: {
            cardCount += offset
        }, label:  {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset  > emojis.count)
    }
    
var cardRemover : some View {
cardController(by: -1, symbol: "rectangle.stack.badge.minus.fill")
}
    var cardAdder : some View {
        cardController(by: 1 , symbol: "rectangle.stack.badge.plus.fill")
    }
    var cards : some View {
        LazyVGrid(columns: [GridItem(), GridItem()]){
            
            ForEach(0..<cardCount, id : \.self){ index in
                CardView(content : emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
            
            
        }.padding()
    }
    var cardControls : some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
            
        }.padding().imageScale(.large).font(.largeTitle)
    }
}

struct CardView : View {
    @State var isFaceUp : Bool = true
    let content : String
    let base = RoundedRectangle(cornerRadius: 25.0)
    var body: some View {
        ZStack{
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 4))
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        
        .foregroundColor(.orange)
        .onTapGesture {
            isFaceUp.toggle()
        }
 
    }
}

#Preview {
    ContentView()
    
}
