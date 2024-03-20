//
//  SwiftUIView.swift
//  Memory Match
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct SwiftUIView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: nil, alignment: nil),
        GridItem(.flexible(),spacing: nil, alignment: nil),
        GridItem(.flexible(),spacing: nil, alignment: nil),
        ]
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]
    //    let randomInt = Int.random(in: 0..<emojis.indices)
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var gameFinished: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(red:253 / 255, green: 174 / 255, blue: 169 / 255))
                .position(CGPoint(x: 400, y: 800.0))
            Circle()
                .fill(Color(red:221 / 255, green: 229 / 255, blue: 155 / 255))
                .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
            VStack
            {
                Text("Current score: \(score)")
                    .font(.largeTitle)
                
                LazyVGrid(columns: columns) {
                    ForEach(emojis.indices, id: \.self) { index in
                        Button(action: {tilePressed(index: index)}, label: {
                            TileView(emoji: emojis[index], isFlipped: cardsFlipped[index])
                        })
                        }
                    }
                
                if score >= 6{
                    HStack
                    {
                        NavigationLink(destination: endPage(), label: {
                            Text("next")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.custom("MadimiOne-Regular", size: 35))
                                .navigationBarBackButtonHidden(true)
                        })
                        NavigationLink(destination: SwiftUIView(), label: {
                            Text("Retry")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.custom("MadimiOne-Regular", size: 35))
                                .navigationBarBackButtonHidden(true)
                        })
                    }
                }
            }
        }
//        Circle()
//            .zIndex(0)
////            .position(x:10 , y:10)
        }
    func tilePressed(index: Int)
        {
//            cardsFlipped[index] = true
            if pickOne == -1 || pickTwo == -1
            {
                if pickOne == -1
                {
                    pickOne = index
                    cardsFlipped[index] = true
                }
                else
                {
                    pickTwo = index
                    cardsFlipped[index] = true
                    if emojis[pickOne] == emojis[pickTwo]
                    {
                        score += 1
                        pickOne = -1
                        pickTwo = -1
                    }
                    else
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3)
                        {
                            cardsFlipped[pickOne] = false
                            cardsFlipped[pickTwo] = false
                            pickOne = -1
                            pickTwo = -1
                        }
                    }
                }
            }
           
        }
    }

#Preview {
    SwiftUIView()
}
