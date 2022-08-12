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
    
    var currentTheme : String {
        if (EmojiMemoryGame.animals.contains(EmojiMemoryGame.emojiArray[0])){
            return "animal"
        }
        else if (EmojiMemoryGame.vehicles.contains(EmojiMemoryGame.emojiArray[0])){
            return "vehicle"
        }
        else if (EmojiMemoryGame.foods.contains(EmojiMemoryGame.emojiArray[0])){
            return "food"
        }
        else{
            return ""}
    }
    
    
    // MARK : - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func theme(_ arr: Array<String>){
        EmojiMemoryGame.emojiArray = arr.shuffled()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func shuffledata(){
        EmojiMemoryGame.emojiArray = [EmojiMemoryGame.animals.shuffled(), EmojiMemoryGame.vehicles.shuffled(), EmojiMemoryGame.foods.shuffled()].randomElement()!
    }
    
    func checkTheme() -> Array<String>{
        return EmojiMemoryGame.emojiArray
    }
}
