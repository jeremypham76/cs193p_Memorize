//
//  ContentView.swift
//  Memorize
//
//  Created by Jeremy Pham on 7/31/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame //connect with the signal that are publised in EmojiMemoryGame
    
    @State var whichTheme = ""
    
    var animalTheme: some View{
        Button( action: {
            whichTheme = "animal"
            viewModel.theme(EmojiMemoryGame.animals)
            }, label: {
                Image(systemName: "pawprint.circle")
            }).foregroundColor( (whichTheme == "animal") ? .green : .red )
    }

    var vehicleTheme: some View{
            Button(action: {
                whichTheme = "vehicle"
                viewModel.theme(EmojiMemoryGame.vehicles)
            }, label: {
                Image(systemName: "car.circle")
            }).foregroundColor( (whichTheme == "vehicle") ? .green : .red )
    }

    var foodTheme: some View{
            Button(action: {
                whichTheme = "food"
                viewModel.theme(EmojiMemoryGame.foods)
            }, label: {
                Image(systemName: "fork.knife.circle")
            }).foregroundColor( (whichTheme == "food") ? .green : .red )
    }
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(viewModel.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            
            
            HStack{
                animalTheme
                Spacer()
                vehicleTheme
                Spacer()
                foodTheme
            }
            .font(.largeTitle)
            .padding()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape
                    .fill()
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
    }
}
