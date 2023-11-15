//
//  ContentView.swift
//  cs193p-App1
//
//  Created by George on 11/11/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiGameViewModel
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Button("Shuffle"){
                viewModel.shuffleCards()
            }.font(.title3)
        }
    }
    
    

    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            
            ForEach(viewModel.cards.indices, id : \.self){ index in
                CardView(content : viewModel.cards[index].content).aspectRatio(2/3, contentMode: .fit)
            }
            
            
        }
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
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.system(size: 200)).minimumScaleFactor(0.01).aspectRatio(1,contentMode: .fit)
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
    ContentView(viewModel: EmojiGameViewModel())
    
}
