//
//  Untitled.swift
//  TicTacToeApp
//
//  Created by Qasim Uddin on 2024-10-17.
//
import Foundation

enum Player {
    case X
    case O
}

class TicTacModel:ObservableObject{
    
    @Published var board:[Player?] = Array(repeating: nil, count: 9)
    @Published var activePlayer: Player = .X
    @Published var winner:Player? = nil
    
    //Button pressed
    func buttonTap(i:Int){
        
        guard board[i] == nil && winner == nil else{
            return
        }
        
        board[i] = activePlayer
        
        if checkWinner() {
            winner = activePlayer
            print("\(activePlayer) has won the game!!")
        } else {
            activePlayer = (activePlayer == .X) ? .O : .X
        }
        
    }
    
    //Labelbutton
    func buttonLabel(i:Int) -> String {
        if let player = board[i] {
            return player == .X ? "X" : "O"
        }
        return ""
    }
    //resetgame
    func resetGame() {
        board = Array(repeating: nil, count:9)
        activePlayer = .X
        winner = nil
    }
    
    //Winner
    func checkWinner() -> Bool {
        //rows
        for i in stride(from: 0, to: 9, by: 3) {
            if board[i] == activePlayer && board[i+1] == activePlayer && board[i+2] == activePlayer {
                return true
            }
        }

        
        
        //Cols
        for i in 0..<3 {
            if board[i] == activePlayer && board[i+3] == activePlayer && board[i+6] == activePlayer {
                return true
            }
        }
        
        
        //diag
        if board[0] == activePlayer && board[4] == activePlayer && board[8] == activePlayer{
            return true
        }
        if board[2] == activePlayer && board[4] == activePlayer && board[6] == activePlayer{
            return true
        }
        
        
        
        return false
    }
    
}
