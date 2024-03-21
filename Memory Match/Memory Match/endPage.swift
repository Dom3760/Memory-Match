//
//  endPage.swift
//  Memory Match
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct endPage: View {
    var body: some View {
        // makes a z stack to put circles behind the text
            // adds navigation view to make buttons work
            NavigationView
            {
                ZStack {
                    //circle
                    Circle()
                        //fills the circle with cutom color.
                        .fill(Color(red:221 / 255, green: 229 / 255, blue: 155 / 255))
                        //puts button on the bottom right
                        .position(CGPoint(x: 400, y: 800.0))
                    //circle
                    Circle()
                        //fills the circle with cutom color.
                        .fill(Color(red:253 / 255, green: 174 / 255, blue: 169 / 255))
                        //puts the button on top left
                        .position(CGPoint(x: 10.0, y: 10.0))
                    //vertical stack that puts emoji, text, and Hstack
                    VStack
                    {
                        Text("😀")
                            //custom font
                            .font(.system(size: 200))
                        Text("Great Job!")
                            // makes custom font and resize's it.
                            .font(.custom("MadimiOne-Regular", size: 30))
                        NavigationLink(destination: SwiftUIView().navigationBarBackButtonHidden(true)) {
                            // adds text, padding, background color, text color, rounds corners
                            Text("Play Again")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                //custom font and text size
                                .font(.custom("MadimiOne-Regular", size: 40))
                        }
                        //adds plain button style(makes my button work)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }


#Preview {
    endPage()
}
