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
    @State var isFaceUp : Bool = false
    let base = RoundedRectangle(cornerRadius: 25.0)
    var body: some View {
        ZStack(content : {
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 4))
                Text("👻").font(.largeTitle)
            }
            else {
                base
            }
        })

        .foregroundColor(.orange)
        .onTapGesture {
            isFaceUp.toggle()
        }
 
    }
}

#Preview {
    ContentView()
    
}
