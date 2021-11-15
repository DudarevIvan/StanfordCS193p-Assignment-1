//
//  ContentView.swift
//  StanfordCS193p-Assignment-1
//
//  Created by Ivan Dudarev on 15.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: Array<String> = ["🚂", "🚜", "🚁", "🚀", "🚲", "🛫", "🚢", "🦼", "🎢", "🛰", "🏎", "🚓", "🚒", "🚑", "🛵", "🚆", "🚞", "⛴", "🗺", "🛸"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65.0))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer(minLength: 20.0)
            HStack {
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }

    }
    
    var remove: some View {
        Button  {
            if emojiCount > 1 {
               emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
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
    }
}
