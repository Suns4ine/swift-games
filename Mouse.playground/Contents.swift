//: Playground - noun: a place where people can play
//🐭🧀🍽◾️◻️🕸🍪🍗

import UIKit

enum Coordinat {
    case left
    case right
    case up
    case down
}

struct Mouse {
    var x: Int
    var y: Int
    var emoji: String
    var alive: Bool
}

class Cheese {
    var x: Int?
    var y: Int?
    var emoji: String = "🕸"
    var alive:  Bool
    
    init(x: Int?, y: Int?, emoji: String, alive: Bool) {
        self.x = x
        self.y = y
        self.emoji = emoji
        self.alive = alive
    }
}

struct Plate {
    var x: Int
    var y: Int
    var emoji: String
    var alive: Bool
}

class Room {
    let width: Int
    let length: Int
    static var mouse  = Mouse(x: 1, y: 1, emoji: "🐭", alive: true)
    static var cheese = Cheese(x: 3, y: 3, emoji: "🧀", alive: true)
    static var coockie = Cheese(x: 4, y: 5, emoji: "🍪", alive: true)
    static var poultry = Cheese(x: 7, y: 3, emoji: "🍗", alive: true)
    static var plate = Plate(x: 8, y: 7, emoji: "🍽", alive: true)
    static var numb = 0
    static var newPosition = -1
    
    static var eat = [Room.cheese, Room.coockie, Room.poultry]
    
     func traffic(traf: Coordinat) {
     
        var numX = 0
        var numY = 0
        
        switch traf {
        case Coordinat.left:
            Room.mouse.y -= 1
            numY += 1
            for eats in Room.eat {
                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
                    eats.y! -= 1
                }
            }
        case Coordinat.right:
            Room.mouse.y += 1
            numY -= 1
            for eats in Room.eat {
                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
                    eats.y! += 1
                }
            }
        case Coordinat.up:
            Room.mouse.x -= 1
            numX += 1
            for eats in Room.eat {
                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
                    eats.x! -= 1
                }
            }
        case Coordinat.down:
            Room.mouse.x += 1
            numX -= 1
            for eats in Room.eat {
                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
                    eats.x! += 1
                }
            }
        }
        
        for var eats in Room.eat {
            if checkCheeseCoordinat(coordinat: &eats) == true && eats.alive == true {
                if numX != 0 {
                    Room.mouse.x += numX
                    eats.x! += numX
                } else if numY != 0 {
                    Room.mouse.y += numY
                    eats.y! += numY
                }
            }
        }
        
        for eats in Room.eat {
            if eats.x == Room.plate.x && eats.y == Room.plate.y {
                
                eats.alive = false
                eats.x = Room.newPosition
                eats.y = Room.newPosition
                Room.newPosition -= 1
                Room.numb += 1
                if Room.numb == Room.eat.count {
                Room.plate.alive = false
                print("""
                    В крысу, как всегда!
                    Мммм, спизженное, вдвойне вкуснее.
                    Чисто ты, коль.
                    """)
                }
            }
        }
        
        checkCoordinat(coordinat: &Room.mouse)
        printRoom(position: &Room.mouse)
    }
    
    func checkCheeseCoordinat(coordinat: inout Cheese) -> Bool {
    
        for eats in Room.eat{
            if eats.emoji == coordinat.emoji {
                return false
            }
            switch (coordinat.x!, coordinat.y!) {
            case (coordinat.x!, coordinat.y!) where coordinat.x == eats.x! && coordinat.y == eats.y!:
                return true
            case (coordinat.x!, coordinat.y!) where coordinat.x! >= width && coordinat.y! >= length:
                return true
            case (coordinat.x!, coordinat.y!) where coordinat.x! <= 1 && coordinat.y! <= 1:
                return true
            case (coordinat.x!, _) where coordinat.x! >= width:
                return true
            case (coordinat.x!, _) where coordinat.x! < 1:
                return true
            case (_, coordinat.y!) where coordinat.y! >= length:
                return true
            case (_, coordinat.y!) where coordinat.y! < 1:
                return true
            default:
                break
            }
        }
        return false
    }
    
    func checkCoordinat(coordinat: inout Mouse) {
        
        switch (coordinat.x, coordinat.y) {
        case (coordinat.x, coordinat.y) where coordinat.x >= width && coordinat.y >= length:
            coordinat.x = width - 1
            coordinat.y = length - 1
        case (coordinat.x, coordinat.y) where coordinat.x <= 1 && coordinat.y <= 1:
            coordinat.x = 1
            coordinat.y = 1
        case (coordinat.x, _) where coordinat.x >= width:
            coordinat.x = width - 1
        case (coordinat.x, _) where coordinat.x < 1:
            coordinat.x = 1
        case (_, coordinat.y) where coordinat.y >= length:
            coordinat.y = length - 1
        case (_, coordinat.y) where coordinat.y < 1:
            coordinat.y = 1
        default:
            break
        }
    }
    
    func printRoom(position: inout Mouse) {
        
        for row in 0...width {
            for colum in 0...length {
                let delta = width - length
                switch (row, colum) {
                case (_, 0): print("◾️", terminator:"")
                case (_, width - delta): print("◾️", terminator:"")
                case (0, _): print("◾️", terminator:"")
                case (length + delta, _): print("◾️", terminator:"")
                case (Room.mouse.x, Room.mouse.y) where Room.mouse.alive == true: print(Room.mouse.emoji, terminator:"")
                case (Room.cheese.x!, Room.cheese.y!) where Room.cheese.alive == true: print(Room.cheese.emoji, terminator:"")
                case (Room.coockie.x!, Room.coockie.y!) where Room.coockie.alive == true: print(Room.coockie.emoji, terminator:"")
                case (Room.poultry.x!, Room.poultry.y!) where Room.poultry.alive == true: print(Room.poultry.emoji, terminator:"")
                case (Room.plate.x, Room.plate.y)where Room.plate.alive == true: print(Room.plate.emoji, terminator:"")
                default:
                    print("◻️", terminator:"")
                    }
                }
                print()
            }
        }
    
    func newGame() {
         Room.mouse  = Mouse(x: 1, y: 1, emoji: "🐭", alive: true)
         Room.cheese = Cheese(x: 3, y: 3, emoji: "🧀", alive: true)
         Room.plate = Plate(x: 8, y: 7, emoji: "🍽", alive: true)
         Room.coockie = Cheese(x: 4, y: 5, emoji: "🍪", alive: true)
         Room.poultry = Cheese(x: 7, y: 3, emoji: "🍗", alive: true)
         printRoom(position: &Room.mouse)
    }
    
    func printCoordinat() {
        print(Room.cheese.x!, Room.cheese.y!)
        print(Room.coockie.x!, Room.coockie.y!)
        print(Room.poultry.x!, Room.poultry.y!)
    }
    
    init (width: Int, length: Int) {
        self.width = width
        self.length = length
        printRoom(position: &Room.mouse)
    }
}

var room = Room(width: 10, length: 10)
room.traffic(traf: .down)
room.traffic(traf: .down)
//room.traffic(traf: .down)
//room.traffic(traf: .down)
//room.traffic(traf: .down)
//room.traffic(traf: .down)
//room.traffic(traf: .right)
//room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .up)
room.traffic(traf: .right)
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .up)
room.traffic(traf: .up)
room.traffic(traf: .up)
room.traffic(traf: .up)
room.traffic(traf: .left)
room.traffic(traf: .left)
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .left)
room.traffic(traf: .down)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .left)
room.traffic(traf: .left)
room.traffic(traf: .left)
room.traffic(traf: .left)
room.traffic(traf: .up)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .right)
room.traffic(traf: .up)
room.traffic(traf: .right)
room.traffic(traf: .down)
room.printCoordinat()























