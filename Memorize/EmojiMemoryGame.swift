//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeremy Pham on 8/10/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject { //ObservableObject is working thank to @Published model
    
    static let emojis = ["🐶","🐹","🐼","🦊","🐯","🦁","🐵","🐮","🐷","🐰","🐔","🐧","🐥","🐴","🐝","🐙","🦑","🐬","🐡","🐠","🦈","🐋"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 12) { pairIndex in EmojiMemoryGame.emojis[pairIndex]} //trailing closure
    }
    
    @Published private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK : - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
