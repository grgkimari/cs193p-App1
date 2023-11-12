//
//  ContentView.swift
//  cs193p-App1
//
//  Created by George on 11/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
           
        }.padding()
        
    }
}

struct CardView : View {
    var isFaceUp : Bool = false
    var body: some View {
        ZStack(content : {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(style: StrokeStyle(lineWidth: 4))
                Text("👻").font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 25.0)
            }
        })

        .foregroundColor(.orange)
 
    }
}

#Preview {
    ContentView()
}
