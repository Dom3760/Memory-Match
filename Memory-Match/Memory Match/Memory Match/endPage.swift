//
//  endPage.swift
//  Memory Match
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct endPage: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(red:221 / 255, green: 229 / 255, blue: 155 / 255))
                .position(CGPoint(x: 400, y: 800.0))
            Circle()
                .fill(Color(red:253 / 255, green: 174 / 255, blue: 169 / 255))
                .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
            VStack
            {
                Text("😀")
                    .font(.system(size: 200))
                Text("Great Job!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    endPage()
}
