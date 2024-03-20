//
//  ContentView.swift
//  Memory Match
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Image("IMG_0634")
                //here
                VStack{
                    
                    
                    Text("Emojimatch")
                        .padding(10)
                        .font(.custom("MadimiOne-Regular", size: 45))
                        .background(Color.orange)
                        .cornerRadius(10)
                        .frame(width: 400, height: 200)
                        .foregroundColor(.white)
                        .padding()
                        .offset(y: -200)
                    
                    
                    NavigationLink(destination: SwiftUIView(), label: {
                        Text("Start")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.custom("MadimiOne-Regular", size: 35))
                            .navigationBarBackButtonHidden(true)
                    })
                }
            }
            .background()
        }
    }
        
}

#Preview {
    ContentView()
}
