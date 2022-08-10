//
//  ContentView.swift
//  Memorize
//
//  Created by Jeremy Pham on 7/31/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🐶","🐹","🐼","🦊","🐯","🦁","🐵","🐮","🐷","🐰","🐔","🐧","🐥","🐴","🐝","🐙","🦑","🐬","🐡","🐠","🦈","🐋"]
    
    
    @State var emojiCount = 8
    
    
    var body: some View {
        VStack{
            
            Text("Memorize !!!")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<emojiCount], id: \.self){emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/2.8,contentMode: .fit)
                    }
                }
            }
            
            HStack{
                remove
                Spacer()
                animalTheme
                vehicleTheme
                foodTheme
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding()
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var animalTheme: some View{
        Button(action: {
            let animals = ["🐶","🐹","🐼","🦊","🐯","🦁","🐵","🐮","🐷","🐰","🐔","🐧","🐥","🐴","🐝","🐙","🦑","🐬","🐡","🐠","🦈","🐋"]
            emojis = animals.shuffled()
        }, label: {
            Image(systemName: "pawprint.circle")
        })
    }
    
    var vehicleTheme: some View{
        Button(action: {
            let vehicles = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚔","🚍","🛵","🏍","🛺","✈️","🚀","🛸","🚁"]
            emojis = vehicles.shuffled()
        }, label: {
            Image(systemName: "car.circle")
        })
    }
    
    var foodTheme: some View{
        Button(action: {
            let foods = ["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🍆","🥑","🍗","🍖","🌭","🍔","🍕","🌮","🫔","🥪","🥗"]
            emojis = foods.shuffled()
        }, label: {
            Image(systemName: "fork.knife.circle")
        })
    }
    
    var remove: some View{
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.square")
        })
    }
    
    
    var add: some View{
        Button(action: {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.square")
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
    }
}
