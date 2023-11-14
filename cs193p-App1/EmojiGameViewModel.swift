//
//  EmojiGameViewModel.swift
//  cs193p-App1
//
//  Created by George on 13/11/2023.
//

import SwiftUI
func createCardContent(forPairAtIndex index : Int) -> String{
    let emojis : Array<String> = ["👽", "😈", "👻", "🎃", "🤡", "💀", "☠️","🧚","👠", "🐶"]
    return emojis[index]
}

class EmojiGameViewModel{
    private var model = GameLogicModel<String>(numberOfPairsOfCards: 4, cardContentMaker: createCardContent)
    
    
    var cards : Array<GameLogicModel<String>.Card>{
        return model.cards
    }
    
    func chooseIntent(card : GameLogicModel<String>.Card){
        model.chooseCard(card: <#T##GameLogicModel<String>.Card#>)
    }
}

