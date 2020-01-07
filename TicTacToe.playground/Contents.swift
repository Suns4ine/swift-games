//: Playground - noun: a place where people can play

import UIKit

class TicTacToe {
    
    var arrayTicTac = Array(repeating: "◻️", count: 9)
    var lastMove: String?
    
    func printField() {
        
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
        printField()
    }
    
    func checkWinner(winner: String) {
        
        var k = 0
        
        switch winner {
        case winner where arrayTicTac[0] == winner && arrayTicTac[1] == winner && arrayTicTac[2] == winner:
            print("You are Winner!")
            newGame()
        case winner where arrayTicTac[3] == winner && arrayTicTac[4] == winner && arrayTicTac[5] == winner:
            print("You are Winner!")
            newGame()
        case winner where arrayTicTac[6] == winner && arrayTicTac[7] == winner && arrayTicTac[8] == winner:
            print("You are Winner!")
            newGame()
        case winner where arrayTicTac[0] == winner && arrayTicTac[3] == winner && arrayTicTac[6] == winner:
            print("You are Winner!")
            newGame()
        case winner where arrayTicTac[1] == winner && arrayTicTac[4] == winner && arrayTicTac[7] == winner:
            print("You are Winner!")
            newGame()
        case winner where arrayTicTac[2] == winner && arrayTicTac[5] == winner && arrayTicTac[8] == winner:
            print("You are Winner!")
            newGame()
        case winner where arrayTicTac[0] == winner && arrayTicTac[4] == winner && arrayTicTac[8] == winner:
            print("You are Winner!")
            newGame()
        case winner where arrayTicTac[2] == winner && arrayTicTac[4] == winner && arrayTicTac[6] == winner:
            print("You are Winner!")
            newGame()
        default:
            break
        }
        
        for ( index, value) in arrayTicTac.enumerated() {
            if arrayTicTac[index] != "◻️" {
                k += 1
            }
            if k == 9 {
                print("Ничья")
                newGame()
            }
        }
    }
    
    func checkMove(emoji: String) -> Bool {
        
        switch lastMove {
        case nil:
            lastMove = emoji
            return true
        case lastMove!? where lastMove! == emoji:
            print("Сейчас ходит другой")
            return false
        case lastMove!? where lastMove! != emoji:
            lastMove = emoji
            return true
        default:
            print("Что-то пошло не так")
            return false
        }
    }
    subscript(column: Int, row: Int, emoji: String) -> String? {
        
        var rest = row
        if row <= 0 || column <= 0 || row > 3 || column > 3 {
            return nil
        }
        
        switch(column){
        case 1: break
        case 2: rest += 3
        case 3: rest += 6
        default:
            return nil
        }
        
        if emoji != "x" && emoji != "o" {
            print("Введите коректный знак")
            return nil
        }
        
        for (index, _) in arrayTicTac.enumerated() {
            if index == (rest - 1) && arrayTicTac[index] == "◻️" && checkMove(emoji: emoji) == true {
                if emoji == "x" {
                    arrayTicTac[index] = "⚔️"
                    printField()
                    checkWinner(winner: arrayTicTac[index])
                    return arrayTicTac[index]
                } else if emoji == "o" {
                    arrayTicTac[index] = "⚫️"
                    printField()
                    checkWinner(winner: arrayTicTac[index])
                    return arrayTicTac[index]
                }
            }
        }
        return nil
    }
}

var ticTacToe = TicTacToe()
ticTacToe.printField()
		








