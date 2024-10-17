//
//  ContentView.swift
//  TicTacToeApp
//
//  Created by Qasim Uddin on 2024-10-17.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject var TicTac = TicTacModel()
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.system(size: 40, weight: .heavy))
            
            let columns = Array(repeating: GridItem(.flexible()), count: 3)
            
            LazyVGrid(columns: columns) {
                ForEach(0..<9, id: \.self) { i in
                    Button(action: {
                        TicTac.buttonTap(i: i)
                    }, label: {
                        Text(TicTac.buttonLabel(i: i))
                            .frame(width: 100, height: 100)
                            .background(Color.red)
                            .foregroundColor(.black)
                            .font(.system(size: 45, weight: .heavy))
                    })
                }
            } 
            .padding(.bottom)
            
            Button(action: { 
                TicTac.resetGame()
            }, label: {
                Text("RESTART GAME")
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .heavy))
                    .clipShape(.capsule)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
