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
    
    static var emojiArray = animals.shuffled()
    
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
    
    func animalTheme(){
        EmojiMemoryGame.emojiArray = EmojiMemoryGame.animals.shuffled()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func vehicleTheme(){
        EmojiMemoryGame.emojiArray = EmojiMemoryGame.vehicles.shuffled()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func foodTheme(){
        EmojiMemoryGame.emojiArray = EmojiMemoryGame.foods.shuffled()
        model = EmojiMemoryGame.createMemoryGame()
    }
}
