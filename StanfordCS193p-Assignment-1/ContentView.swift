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
            // #1
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.medium)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65.0))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer(minLength: 20.0)
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
            let vehiclesEmojis: Array<String> = ["🚗", "🚕", "🚙", "🚌", "🛻", "🛵", "🚔", "🚲", "🚛", "🚒"]
            // shuffled()
            emojis = vehiclesEmojis.shuffled()
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
            let natureEmojis: Array<String> = ["🐸", "🦁", "🐯", "🦄", "🦋", "🐛", "🐞", "🐜", "🐌", "🐠", "🌲", "🍄", "⭐️", "🌺", "🌹"]
            // shuffled()
            emojis = natureEmojis.shuffled()
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
            let weatherEmojis: Array<String> = ["☀️", "⚡️", "⛅️", "☁️", "❄️", "🌧", "🌬", "☔️", "💨"]
            // Shuffle()
            emojis = weatherEmojis
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "cloud")
                Text("Weather")
                    .font(.headline)
            }
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
