//: Playground - noun: a place where people can play
//🐭🧀🍽◾️◻️◻️

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

struct Cheese {
    var x: Int
    var y: Int
    var emoji: String
    var alive: Bool
}

struct Plate {
    var x: Int
    var y: Int
    var emoji: String
    var alive: Bool
}

struct Room {
    let width: Int
    let length: Int
    static var mouse  = Mouse(x: 1, y: 1, emoji: "🐭", alive: true)
    static var cheese = Cheese(x: 3, y: 3, emoji: "🧀", alive: true)
    static var plate = Plate(x: 8, y: 7, emoji: "🍽", alive: true)
    
    
    mutating func traffic(traf: Coordinat) {
     
        var numX = 0
        var numY = 0
        
        switch traf {
        case Coordinat.left:
            Room.mouse.y -= 1
            numY += 1
            if Room.cheese.y == Room.mouse.y && Room.cheese.x == Room.mouse.x && Room.cheese.alive == true {
                Room.cheese.y -= 1
            }
        case Coordinat.right:
            Room.mouse.y += 1
            numY -= 1
            if Room.cheese.y == Room.mouse.y && Room.cheese.x == Room.mouse.x && Room.cheese.alive == true {
                Room.cheese.y += 1
            }
        case Coordinat.up:
            Room.mouse.x -= 1
            numX += 1
            if Room.cheese.y == Room.mouse.y && Room.cheese.x == Room.mouse.x && Room.cheese.alive == true {
                Room.cheese.x -= 1
            }
        case Coordinat.down:
            Room.mouse.x += 1
            numX -= 1
            if Room.cheese.y == Room.mouse.y && Room.cheese.x == Room.mouse.x && Room.cheese.alive == true {
                Room.cheese.x += 1
            }
        }
        
        if checkCheeseCoordinat(coordinat: &Room.cheese) == true && Room.cheese.alive == true {
            if numX != 0 {
                Room.mouse.x += numX
                Room.cheese.x += numX
            } else if numY != 0 {
                Room.mouse.y += numY
                Room.cheese.y += numY
            }
        }
        
        if Room.cheese.x == Room.plate.x && Room.cheese.y == Room.plate.y {
        
            Room.cheese.alive = false
            Room.cheese.x = -1
            Room.cheese.y = -1
            Room.plate.alive = false
            print("""
                В крысу, как всегда!
                Мммм, спизженное, вдвойне вкуснее.
                """)
            
        }
        
        checkCoordinat(coordinat: &Room.mouse)
        printRoom(position: &Room.mouse)
    }
    
    func checkCheeseCoordinat(coordinat: inout Cheese) -> Bool {
    
        switch (coordinat.x, coordinat.y) {
        case (coordinat.x, coordinat.y) where coordinat.x >= width && coordinat.y >= length:
            return true
        case (coordinat.x, coordinat.y) where coordinat.x <= 1 && coordinat.y <= 1:
            return true
        case (coordinat.x, _) where coordinat.x >= width:
            return true
        case (coordinat.x, _) where coordinat.x < 1:
            return true
        case (_, coordinat.y) where coordinat.y >= length:
            return true
        case (_, coordinat.y) where coordinat.y < 1:
            return true
        default:
            break
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
        case (coordinat.x, _) where coordinat.x <= 1:
            coordinat.x = 1
        case (_, coordinat.y) where coordinat.y >= length:
            coordinat.y = length - 1
        case (_, coordinat.y) where coordinat.y <= 1:
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
                case (Room.cheese.x, Room.cheese.y) where Room.cheese.alive == true: print(Room.cheese.emoji, terminator:"")
                case (Room.plate.x, Room.plate.y)where Room.plate.alive == true: print(Room.plate.emoji, terminator:"")
                default:
                    print("◻️", terminator:"")
                }
            }
            print()
        }
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
room.traffic(traf: .down)
room.traffic(traf: .down)
room.traffic(traf: .down)
