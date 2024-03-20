//
//  TileView.swift
//  Memory Match
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct TileView: View {
    var emoji: String
    var isFlipped: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(!isFlipped ? Color.blue : Color.clear )
            .frame(width: 80, height: 80)
            if isFlipped == true
            {
                Text(emoji)
            }
        }
    }
}

#Preview {
    TileView(emoji: "😀", isFlipped: true)
}
