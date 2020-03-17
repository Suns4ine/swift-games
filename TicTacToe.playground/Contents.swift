//: Playground - noun: a place where people can play

import UIKit
//⭕️❌◻️

class TicTactoe {
    
    private var arrayTicTac = Array(repeating: "◻️", count: 9)
    private var whoWalks = 0
    
    private func printField() {
        
        print()
        for (var index, value) in arrayTicTac.enumerated() {
            index += 1
            switch index {
            case index where index % 3 != 0: print(value, terminator: "")
            default: print(value)
            }
        }
    }
    
    func newGame() {
        arrayTicTac = Array(repeating: "◻️", count: 9)
        whoWalks = 0
        printField()
    }
    
    private func checkWinner(winner: String) {
        var count = 0
        let string = "\nWinner is \(winner)!"
        
        for (index, _) in arrayTicTac.enumerated() {
            if arrayTicTac[index] == "◻️" {
                count += 1
            }
        }
            
            if count == 9 {
                print("\nNobody won")
                newGame()
            }
        
         switch winner {
            case winner where arrayTicTac[0] == winner && arrayTicTac[1] == winner && arrayTicTac[2] == winner:
                print(string)
                newGame()
            case winner where arrayTicTac[3] == winner && arrayTicTac[4] == winner && arrayTicTac[5] == winner:
                print(string)
                newGame()
            case winner where arrayTicTac[6] == winner && arrayTicTac[7] == winner && arrayTicTac[8] == winner:
                print(string)
                newGame()
            case winner where arrayTicTac[0] == winner && arrayTicTac[3] == winner && arrayTicTac[6] == winner:
                print(string)
                newGame()
            case winner where arrayTicTac[1] == winner && arrayTicTac[4] == winner && arrayTicTac[7] == winner:
                print(string)
                newGame()
            case winner where arrayTicTac[2] == winner && arrayTicTac[5] == winner && arrayTicTac[8] == winner:
                print(string)
                newGame()
            case winner where arrayTicTac[0] == winner && arrayTicTac[4] == winner && arrayTicTac[8] == winner:
                 print(string)
                newGame()
            case winner where arrayTicTac[2] == winner && arrayTicTac[4] == winner && arrayTicTac[6] == winner:
                 print(string)
                newGame()
            default:
                break
            }
    }
    
    subscript(emoji: String, column: Int, row: Int) -> String? {
        
        var rest = row
        
        if row <= 0 || column <= 0 || row > 3 || column > 3 { return nil}
        
        switch column {
        case 1: break
        case 2: rest += 3
        case 3: rest += 6
        default: return nil
        }
        
        if emoji != "x" && emoji != "o" {
            print("\nEnter the correct character")
            return nil
        }
        
        for (index, _ ) in arrayTicTac.enumerated() {
        
            if index == (rest - 1) && arrayTicTac[index] == "◻️" {
                if emoji == "x" && (whoWalks == 1 || whoWalks == 0) {
                    arrayTicTac[index] = "❌"
                    whoWalks = 2
                    printField()
                    checkWinner(winner: arrayTicTac[index])
                } else if emoji == "o" && (whoWalks == 2 || whoWalks == 0) {
                    arrayTicTac[index] = "⭕️"
                    whoWalks = 1
                    printField()
                    checkWinner(winner: arrayTicTac[index])
                }
            }
        }
        return nil
    }
    
    init() {
        print("""
 Hello! This is a tic tac toe game!
To play it, write down a cross or
a toe and its coordinates. Do not
forget that everyone takes turns.
Good luck, have fun!
""")
        printField()
    }
}

var tic = TicTactoe()


