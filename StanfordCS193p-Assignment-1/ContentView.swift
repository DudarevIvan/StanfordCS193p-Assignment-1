//
//  ContentView.swift
//  StanfordCS193p-Assignment-1
//
//  Created by Ivan Dudarev on 15.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis: Array<String> = ["🚗", "🚕", "🚙", "🚌", "🛻", "🛵", "🚔", "🚲", "🚛", "🚒"]
        
    var body: some View {
        VStack {
            // #3
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.medium)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojis.count)))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer(minLength: 20.0)
            // #4
            // Themes
            HStack {
                vehicles
                Spacer()
                nature
                Spacer()
                weather
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    // Themes buttons
    var vehicles: some View {
        Button {
            // #6
            // shuffled()
            let vehiclesEmojis: Array<String> = ["🚗", "🚕", "🚙", "🚌", "🛻", "🛵", "🚔", "🚲", "🚛", "🚒", "🚴🏽‍♀️", "🦼", "✈️", "🚘", "⛵️", "🛳", "🛶", "🚀", "🛸"]
                .shuffled()
            // Extra credit #1
            randomCountCards(for: vehiclesEmojis)
        } label: {
            VStack {
                Image(systemName: "car.2")
                Text("Vehicles")
                    .font(.headline)
            }
        }
    }
 
    var nature: some View {
        Button {
            // #6
            // shuffled()
            let natureEmojis: Array<String> = ["🐸", "🦁", "🐯", "🦄", "🦋", "🐛", "🐞", "🐜", "🐌", "🐠", "🌲", "🍄", "⭐️", "🌺", "🌹", "🪨", "🪵", "🌵", "🐉", "🦩", "🦜"]
                .shuffled()
            // Extra credit #1
            randomCountCards(for: natureEmojis)
        } label: {
            VStack {
                Image(systemName: "leaf")
                Text("Nature")
                    .font(.headline)
            }
        }
    }
    
    var weather: some View {
        Button {
            // #6
            // Shuffle()
            let weatherEmojis: Array<String> = ["☀️", "⚡️", "⛅️", "☁️", "❄️", "🌧", "🌬", "☔️", "💨", "⛱", "🌕", "🌍"]
                .shuffled()
            // Extra credit #1
            randomCountCards(for: weatherEmojis)
        } label: {
            VStack {
                Image(systemName: "cloud")
                Text("Weather")
                    .font(.headline)
            }
        }
    }
    
    // Extra credit #1
    func randomCountCards(for themedEmojis: Array<String>) {
        let cardsCount = Int.random(in: 4..<themedEmojis.count)
        emojis = Array<String>(themedEmojis[0..<cardsCount])
    }
    
    // Extra credit #2
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        // 4x4 (0...16)
        // 5x5 (17...25)

        // cardCount * (4/16)
        // cardCount * (5/25)
        
        let fourCardInLine = Double(cardCount) * (4.0 / 16.0)
        let fiveCardInLine = Double(cardCount) * 5.0 / 25.0

        if 0...4 ~= fourCardInLine {
            return 75.0
        } else if 0...5 ~= fiveCardInLine {
            return 55.0
        } else {
            return 25.0
        }
    }
}


struct CardView: View {
    
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro")
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 13 Pro")
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 8")
    }
}
