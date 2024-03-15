//
//  ContentView.swift
//  Memory Match
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack
        {
            Text("Emojimatch")
                .font(.largeTitle)
                .background(Color.orange)
                .frame(width: 400, height: 200)
            Button (action: start, label: {
                Text("Start")
            })
        }
        .background()
            .image("IMG_0634.png")
    }
        func start ()
        {
            
        }
}

#Preview {
    ContentView()
}
