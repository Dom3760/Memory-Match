//
//  SwiftUIView.swift
//  Memory Match
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct SwiftUIView: View {
    
    let columns: [GridItem] = [
        GridItem(.fixed(100),spacing: nil, alignment: nil)
        GridItem(.fixed(100),spacing: nil, alignment: nil)
        GridItem(.fixed(100),spacing: nil, alignment: nil)
        ]
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var gameFinished: Bool = false
    
    var body: some View {
        VStack
        {
            Text("Current score: \(score)")
                .font(.largeTitle)
            LazyVGrid(columns: columns) {
                ForEach(0..<emojis.count) { index in
                    Button(action: tilePressed, label: {})
                        .background(Color.blue)
                    }
                }
            }
        }
        func tilePressed()
        {
                
        }
    }

#Preview {
    SwiftUIView()
}
