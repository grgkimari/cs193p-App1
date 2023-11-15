//
//  GameLogicModel.swift
//  cs193p-App1
//
//  Created by George on 13/11/2023.
//

import Foundation

struct GameLogicModel<CardContent>{
    private(set) var cards  : Array<Card>
    init(numberOfPairsOfCards : Int, cardContentMaker : (Int) -> CardContent){
        cards = []
        //add numberOfPairsOfCards * 2
        for pairIndex in 0..<numberOfPairsOfCards{
            let cardContent = cardContentMaker(pairIndex)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }
    func chooseCard(_ card : Card){
        
    }
    
    mutating func shuffleCards(){
        cards.shuffle()
    }
    struct Card {
        var isFaceUp : Bool = true
        var isMatched : Bool = false
        var content : CardContent
    }
}
