//
//  TileView.swift
//  Memory Match
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct TileView: View {
    //declare's emoji, and is flipped variiables to be used later.
    var emoji: String
    var isFlipped: Bool
    var body: some View {
        //z stack to put rectangle on emoji
        ZStack {
            //rectangle for the button
            Rectangle()
                //ternary operator to determine if the color should be blue or transparent.
                .fill(!isFlipped ? Color.blue : Color.clear )
                //sets dimensions of rectangle
                .frame(width: 80, height: 80)
            //if is flipped is true then it will make the text the emoji
            if isFlipped
            {
                Text(emoji)
            }
        }
    }
}
//makes a sample case so it will display somthing display.
#Preview {
    TileView(emoji: "😀", isFlipped: true)
}
