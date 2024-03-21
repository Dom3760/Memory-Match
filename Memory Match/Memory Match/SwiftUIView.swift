//
//  SwiftUIView.swift
//  Memory Match
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct SwiftUIView: View {
    // makes a grid with 3 columns making it flexable, no spacing, and no alignment.
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: nil, alignment: nil),
        GridItem(.flexible(),spacing: nil, alignment: nil),
        GridItem(.flexible(),spacing: nil, alignment: nil),
        ]
    //declaring variables for state of the card(flipped or not), and declaring all the emojis.
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]
    //makes private variables that will store the index of the picked cards
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    //stores the current score.
    @State private var score: Int = 0
    //makes a var that says if game is finished.
    @State private var gameFinished: Bool = false
    
    var body: some View {
        //navigaton view so buttons will work.
        NavigationView
        {
            //z stack that puts circles below text
            ZStack {
                //circle
                Circle()
                    // fills circle with the custom color
                    .fill(Color(red:253 / 255, green: 174 / 255, blue: 169 / 255))
                    //positions the circle on the bottom right
                    .position(CGPoint(x: 400, y: 800.0))
                //circle
                Circle()
                    // fills circle with the custom color
                    .fill(Color(red:221 / 255, green: 229 / 255, blue: 155 / 255))
                    //positions the circle on the top left
                    .position(CGPoint(x: 10.0, y: 10.0))
                //puts everything in a vertical stack
                VStack
                {
                    //display's current score and makes the font a title.
                    Text("Current score: \(score)")
                        .font(.largeTitle)
                    //lazy grid that orginizes the buttons
                    LazyVGrid(columns: columns) {
                        //for each loop to put each button
                        ForEach(emojis.indices, id: \.self) { index in
                            //makes a button that will launch the tile pressed function injecting the parameters
                            Button(action: {tilePressed(index: index)}, label: {
                                //Will push emojis, and if the card is flipped to the tile view
                                TileView(emoji: emojis[index], isFlipped: cardsFlipped[index])
                            })
                        }
                    }
                    // if the score is greater or equal to 6 then it will add the buttons below
                    if score >= 6{
                        // horizontially aligns the buttons
                        HStack
                        {
                            //adds the button linking it to the end page and hides the back button
                            NavigationLink(destination: endPage().navigationBarBackButtonHidden(true)) {
                                Text("next")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .font(.custom("MadimiOne-Regular", size: 35))
                            }
                            //adds the button linking it to the SwiftUIView page and hides the back button
                            NavigationLink(destination: SwiftUIView().navigationBarBackButtonHidden(true)) {
                                //adds text to button
                                Text("Retry")
                                    //adds padding, background color of blue, and a text color of white
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    // rounds the corners and adds custom font
                                    .cornerRadius(10)
                                    .font(.custom("MadimiOne-Regular", size: 35))
                            }
                            //adds a button style(?, made the buttons work)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
    }
    //function named tile pressed that handles the button pressed.
    func tilePressed(index: Int)
        {
            //if either pick one or pick two is = to -1 then it will,
            if pickOne == -1 || pickTwo == -1
            {
                //if it is pick one
                if pickOne == -1
                {
                    //bind pickone to the index of the button
                    pickOne = index
                    //makes the index of the button to true
                    cardsFlipped[index] = true
                }
                //else pick two has to be -1
                else
                {
                    //pick 2 will be binded to the current index
                    pickTwo = index
                    //sets the index of the button to true
                    cardsFlipped[index] = true
                    // if the emojis are the same then it will,
                    if emojis[pickOne] == emojis[pickTwo]
                    {
                        //add 1 to the score, pick one is reset, and pick two is reset
                        score += 1
                        pickOne = -1
                        pickTwo = -1
                    }
                    // otherwise the emojis are not the same
                    else
                    {
                        //waits two seconds and then,
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                        {
                            //sets the buttons index back to false, and reverts pick one/two to original value.
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
