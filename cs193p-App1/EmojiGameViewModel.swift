//
//  EmojiGameViewModel.swift
//  cs193p-App1
//
//  Created by George on 13/11/2023.
//

import SwiftUI

class EmojiGameViewModel : ObservableObject{
    private static let emojis : Array<String> = ["👽", "😈", "👻", "🎃", "🤡", "💀", "☠️","🧚","👠", "🐶"]
    @Published private var model = GameLogicModel<String>(
        numberOfPairsOfCards: 9,
         cardContentMaker: {pairIndex in
             if emojis.indices.contains(pairIndex){
                 return emojis[pairIndex]
             }
             return "⁉️"
    })
    var cards : Array<GameLogicModel<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    
    
    func chooseIntent(card : GameLogicModel<String>.Card){
        model.chooseCard(card)
    }
    func shuffleCards(){
        model.shuffleCards()
        objectWillChange.send()
    }
}
