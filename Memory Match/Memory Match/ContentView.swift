//
//  ContentView.swift
//  Memory Match
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //navigation View makes it so the button works
        NavigationView {
            //z stack places the picture behind the things on the screen
            ZStack {
                //links image
                Image("IMG_0634")
                //vertical stack
                VStack{
                    
                    //text for the title of the game
                    Text("Emojimatch")
                        //adds padding, custom font, background color, rounds the corners
                        .padding(10)
                        .font(.custom("MadimiOne-Regular", size: 45))
                        .background(Color.orange)
                        .cornerRadius(10)
                        //gives a width and height, text color, padding, and positions it
                        .frame(width: 400, height: 200)
                        .foregroundColor(.white)
                        .padding()
                        .offset(y: -200)
                    
                    //navigation link will put button on page that will go to SwiftUIView page, and hides button
                    NavigationLink(destination: SwiftUIView().navigationBarBackButtonHidden(true)) {
                        //adds text to the button
                        Text("Start")
                            //adds padding, background color, text color, rounding corners,and custom font
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.custom("MadimiOne-Regular", size: 35))
                    }
                }
            }
            //makes the image the background
            .background()
        }
    }
        
}

#Preview {
    ContentView()
}
