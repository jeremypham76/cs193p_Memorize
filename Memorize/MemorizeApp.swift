//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jeremy Pham on 7/31/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
