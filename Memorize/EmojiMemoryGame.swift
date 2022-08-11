//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeremy Pham on 8/10/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject { //ObservableObject is working thank to @Published model
    
    static let animals = ["🐶","🐹","🐼","🦊","🐯","🦁","🐵","🐮","🐷","🐰","🐔","🐧","🐥","🐴","🐝","🐙","🦑","🐬","🐡","🐠","🦈","🐋"]
    
    static let vehicles = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚔","🚍","🛵","🛺","✈️","🚀","🛸","🚁"]
    
    static let foods = ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥑","🍗","🍖","🌭","🍔","🍕","🌮","🫔","🥪","🥗"]
    
    static var emojiArray : Array<String> = [animals.shuffled(), vehicles.shuffled(), foods.shuffled()].randomElement()!
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in EmojiMemoryGame.emojiArray[pairIndex]} //trailing closure
    }
    
    @Published private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK : - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func theme(_ arr: Array<String>){
        EmojiMemoryGame.emojiArray = arr.shuffled()
        model = EmojiMemoryGame.createMemoryGame()
    }
}
