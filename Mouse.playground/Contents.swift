//: Playground - noun: a place where people can play
//🐭🧀🍽◾️◻️🕸🍪🍗

import UIKit

//enum Coordinat {
//    case left
//    case right
//    case up
//    case down
//}
//
//struct Mouse {
//    var x: Int
//    var y: Int
//    var emoji: String
//    var alive: Bool
//}
//
//struct OldEat {
//    var x: Int?
//    var y: Int?
//    var emoji: String
//    var alive:  Bool
//}
//
//class Cheese {
//    var x: Int?
//    var y: Int?
//    var emoji: String = "🕸"
//    var alive:  Bool
//
//    init(x: Int?, y: Int?, emoji: String, alive: Bool) {
//        self.x = x
//        self.y = y
//        self.emoji = emoji
//        self.alive = alive
//    }
//}
//
//struct Plate {
//    var x: Int
//    var y: Int
//    var emoji: String
//    var alive: Bool
//}
//
//class Room {
//    let width: Int
//    let length: Int
//    static var mouse  = Mouse(x: 1, y: 1, emoji: "🐭", alive: true)
//    static var cheese = Cheese(x: 3, y: 3, emoji: "🧀", alive: true)
//    static var coockie = Cheese(x: 4, y: 5, emoji: "🍪", alive: true)
//    static var poultry = Cheese(x: 7, y: 3, emoji: "🍗", alive: true)
//    static var plate = Plate(x: 8, y: 7, emoji: "🍽", alive: true)
//    static var numb = 0
//    static var newPosition = -1
//
//    static var eat = [Room.cheese, Room.coockie, Room.poultry]
//
//    func traffic(traf: Coordinat) {
//
//        var numX = 0
//        var numY = 0
//        var oldEmoji: String = "🕸"
//
//        switch traf {
//        case Coordinat.left:
//            Room.mouse.y -= 1
//            numY += 1
//            for eats in Room.eat {
//                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
//                    eats.y! -= 1
//                    oldEmoji = eats.emoji
//                }
//            }
//        case Coordinat.right:
//            Room.mouse.y += 1
//            numY -= 1
//            for eats in Room.eat {
//                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
//                    eats.y! += 1
//                    oldEmoji = eats.emoji
//                }
//            }
//        case Coordinat.up:
//            Room.mouse.x -= 1
//            numX += 1
//            for eats in Room.eat {
//                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
//                    eats.x! -= 1
//                    oldEmoji = eats.emoji
//                }
//            }
//        case Coordinat.down:
//            Room.mouse.x += 1
//            numX -= 1
//            for eats in Room.eat {
//                if Room.mouse.x == eats.x && Room.mouse.y == eats.y && eats.alive == true {
//                    eats.x! += 1
//                    oldEmoji = eats.emoji
//                }
//            }
//        }
//
//        for var eats in Room.eat {
//            if oldEmoji == eats.emoji {
//                while checkCheeseCoordinat(coordinat: &eats) == true && eats.alive == true {
//                    if numX != 0 {
//                        Room.mouse.x += numX
//                        eats.x! += numX
//                    } else if numY != 0 {
//                        Room.mouse.y += numY
//                        eats.y! += numY
//                    }
//                }
//            }
//        }
//
//        for var eats in Room.eat {
//            if oldEmoji != eats.emoji {
//                checkCheeseCoordinat(coordinat: &eats)
//            }
//        }
//
//
//        for eats in Room.eat {
//            if eats.x == Room.plate.x && eats.y == Room.plate.y {
//
//                eats.alive = false
//                eats.x = Room.newPosition
//                eats.y = Room.newPosition
//                Room.newPosition -= 1
//                Room.numb += 1
//                if Room.numb == Room.eat.count {
//                Room.plate.alive = false
//                print("""
//                    В крысу, как всегда!
//                    Чисто ты, коль.
//                    """)
//                }
//            }
//        }
//
//        checkCoordinat(coordinat: &Room.mouse)
//        printRoom(position: &Room.mouse)
//    }
//
//     func checkCheeseCoordinat(coordinat: inout Cheese) -> Bool {
//
//        for eats in Room.eat{
//            if eats.emoji == coordinat.emoji {
//                return false
//            }
//            switch (coordinat.x!, coordinat.y!) {
//            case (coordinat.x!, coordinat.y!) where coordinat.x == eats.x! && coordinat.y == eats.y!:
//                return true
//            case (coordinat.x!, coordinat.y!) where coordinat.x! >= width && coordinat.y! >= length:
//                return true
//            case (coordinat.x!, coordinat.y!) where coordinat.x! <= 1 && coordinat.y! <= 1:
//                return true
//            case (coordinat.x!, _) where coordinat.x! >= width:
//                return true
//            case (coordinat.x!, _) where coordinat.x! < 1:
//                return true
//            case (_, coordinat.y!) where coordinat.y! >= length:
//                return true
//            case (_, coordinat.y!) where coordinat.y! < 1:
//                return true
//            default:
//                break
//            }
//        }
//        return false
//    }
//
//    func checkCoordinat(coordinat: inout Mouse) {
//
//        switch (coordinat.x, coordinat.y) {
//        case (coordinat.x, coordinat.y) where coordinat.x >= width && coordinat.y >= length:
//            coordinat.x = width - 1
//            coordinat.y = length - 1
//        case (coordinat.x, coordinat.y) where coordinat.x <= 1 && coordinat.y <= 1:
//            coordinat.x = 1
//            coordinat.y = 1
//        case (coordinat.x, _) where coordinat.x >= width:
//            coordinat.x = width - 1
//        case (coordinat.x, _) where coordinat.x < 1:
//            coordinat.x = 1
//        case (_, coordinat.y) where coordinat.y >= length:
//            coordinat.y = length - 1
//        case (_, coordinat.y) where coordinat.y < 1:
//            coordinat.y = 1
//        default:
//            break
//        }
//    }
//
//    func printRoom(position: inout Mouse) {
//
//        for row in 0...width {
//            for colum in 0...length {
//                let delta = width - length
//                switch (row, colum) {
//                case (_, 0): print("◾️", terminator:"")
//                case (_, width - delta): print("◾️", terminator:"")
//                case (0, _): print("◾️", terminator:"")
//                case (length + delta, _): print("◾️", terminator:"")
//                case (Room.mouse.x, Room.mouse.y) where Room.mouse.alive == true: print(Room.mouse.emoji, terminator:"")
//                case (Room.cheese.x!, Room.cheese.y!) where Room.cheese.alive == true: print(Room.cheese.emoji, terminator:"")
//                case (Room.coockie.x!, Room.coockie.y!) where Room.coockie.alive == true: print(Room.coockie.emoji, terminator:"")
//                case (Room.poultry.x!, Room.poultry.y!) where Room.poultry.alive == true: print(Room.poultry.emoji, terminator:"")
//                case (Room.plate.x, Room.plate.y)where Room.plate.alive == true: print(Room.plate.emoji, terminator:"")
//                default:
//                    print("◻️", terminator:"")
//                    }
//                }
//                print()
//            }
//        }
//
//    func newGame() {
//         Room.mouse  = Mouse(x: 1, y: 1, emoji: "🐭", alive: true)
//         Room.cheese = Cheese(x: 3, y: 3, emoji: "🧀", alive: true)
//         Room.plate = Plate(x: 8, y: 7, emoji: "🍽", alive: true)
//         Room.coockie = Cheese(x: 4, y: 5, emoji: "🍪", alive: true)
//         Room.poultry = Cheese(x: 7, y: 3, emoji: "🍗", alive: true)
//         printRoom(position: &Room.mouse)
//    }
//
//    func printCoordinat() {
//        print(Room.cheese.x!, Room.cheese.y!)
//        print(Room.coockie.x!, Room.coockie.y!)
//        print(Room.poultry.x!, Room.poultry.y!)
//    }
//
//    init (width: Int, length: Int) {
//        self.width = width
//        self.length = length
//        printRoom(position: &Room.mouse)
//    }
//}
//
//var room = Room(width: 10, length: 10)
////var room = Room(width: 10, length: 10)
////room.traffic(traf: .down)
////room.traffic(traf: .down)
////room.traffic(traf: .right)
////room.traffic(traf: .right)
////room.traffic(traf: .right)
//////room.traffic(traf: .up)
//////room.traffic(traf: .right)
//////room.traffic(traf: .down)
////room.printCoordinat()

// x - вниз у - в стороны
class Room {
    
        enum Coordinat {
        case left
        case right
        case up
        case down
    }

    private class Object {
        var emoji: String
        var x: Int
        var y: Int
        var alive: Bool
        
        init(emoji: String, x: Int, y: Int, alive: Bool)
        {
            self.emoji = emoji
            self.x = x
            self.y = y
            self.alive = alive
        }
    }
    
    private var lenght: Int
    private var width: Int
    private var mouse = Object(emoji: "🐭", x: 1, y: 1, alive: true)
    private lazy var plate = Object(emoji: "🍽", x: width/2 + 1, y: lenght/2 + 1, alive: true)
    private lazy var trap = Object(emoji: "🕸", x: width/3 + 1, y: lenght/3 + 1, alive: false)
    private  var cheese = Object(emoji: "🧀", x: 2, y: 2,  alive: true)
    private var coockie = Object(emoji: "🍪", x: 3, y: 5, alive: true)
    private var poultry = Object(emoji: "🍗", x: 3, y: 3, alive: true)
    
    private lazy var eating = [cheese, coockie, poultry]

//    func randomCoordinate(coor: Int)-> Int {
//        var coor = coor - 2
//        return Int(arc4random_uniform(UInt32(coor)))
//    }
    
    func goMouse(go: Coordinat) {
        
        var flagCoordinat = 0
        
        switch go {
        case .left:
            mouse.y = mouse.y >= lenght - 1 ? lenght - 1 : mouse.y + 1
            flagCoordinat = 1
        case .right:
            mouse.y = mouse.y <= 1 ?  1 : mouse.y - 1
            flagCoordinat = 2
        case .down:
            mouse.x = mouse.x >= width - 1 ? width - 1 : mouse.x + 1
            flagCoordinat = 3
        case .up:
            mouse.x = mouse.x <= 1 ? 1 : mouse.x - 1
            flagCoordinat = 4
        }
        
        for eat in eating {
            if eat.alive == true {
                switch go {
                case .left:
                    eat.y = (mouse.y == eat.y && mouse.x == eat.x) ? eat.y + 1: eat.y
                    if eat.y >= lenght {
                        eat.y -= 1
                        mouse.y -= 1
                    }
                case .right:
                    eat.y = (mouse.y == eat.y && mouse.x == eat.x) ? eat.y - 1: eat.y
                    if eat.y <= 0 {
                        eat.y += 1
                        mouse.y += 1
                    }
                case .down:
                    eat.x = (mouse.y == eat.y && mouse.x == eat.x) ? eat.x + 1: eat.x
                    if eat.x >= width {
                        eat.x -= 1
                        mouse.x -= 1
                    }
                case .up:
                    eat.x = (mouse.y == eat.y && mouse.x == eat.x) ? eat.x - 1: eat.x
                    if eat.x <= 0 {
                        eat.x += 1
                        mouse.x += 1
                    }
                }
            }
        }

        switch flagCoordinat {
        case 1:
            mouse.y = (mouse.x == plate.x && mouse.y == plate.y) ? mouse.y - 1 : mouse.y
        case 2:
            mouse.y = (mouse.x == plate.x && mouse.y == plate.y) ? mouse.y + 1 : mouse.y
        case 3:
            mouse.x = (mouse.x == plate.x && mouse.y == plate.y) ? mouse.x - 1 : mouse.x
        case 4:
            mouse.x = (mouse.x == plate.x && mouse.y == plate.y) ? mouse.x - 1 : mouse.x
        default: break
        }
        
        if trap.alive == true {
            switch (trap.x, trap.y) {
            case (trap.x, trap.y) where mouse.x == trap.x && mouse.y == trap.y:
                mouse.x = 1
                mouse.y = 1
                print("Oops, your mouse is trapped.")
            case (trap.x, trap.y) where cheese.x == trap.x && cheese.y == trap.y:
                cheese.x = 2
                cheese.y = 2
                print("Oops, your cheese is trapped.")
            case (trap.x, trap.y) where coockie.x == trap.x && coockie.y == trap.y:
                coockie.x = 3
                coockie.y = 3
                print("Oops, your cookie is trapped.")
            case (trap.x, trap.y) where poultry.x == trap.x && poultry.y == trap.y:
                poultry.x = 3
                poultry.y = 5
                print("Oops, your poultry is trapped.")
            default: break
            }
        }

        checkGame()
        printRoom()
    }
    
    private func checkGame() {
        var countEats = 0
        
        for eat in eating {
            if eat.x == plate.x && eat.y == plate.y {
                eat.alive = false
               // eat.x = -countEats - 10
               // eat.y = -countEats - 10
            }
            countEats = eat.alive == true ? countEats : countEats + 1
        }
        
        if countEats == eating.count {
            print("Uhuuuu, your mouse ate everything!\nYou won!")
            plate.alive = false
            return
        }
    }
    
    func printRoom() {
                for row in 0...width {
                    for colum in 0...lenght {
                        let delta = width - lenght
                        switch (row, colum) {
                        case (_, 0): print("◼️", terminator:"")
                        case (_, width - delta): print("◼️", terminator:"")
                        case (0, _): print("◼️", terminator:"")
                        case (lenght + delta, _): print("◼️", terminator:"")
                        case (mouse.x, mouse.y) where mouse.alive == true: print("\(mouse.emoji)", terminator:"")
                        case (plate.x, plate.y) where plate.alive == true: print("\(plate.emoji)", terminator:"")
                        case (trap.x, trap.y) where trap.alive == true: print("\(trap.emoji)", terminator: "")
                        case(cheese.x, cheese.y) where cheese.alive == true: print("\(cheese.emoji)", terminator: "")
                        case(coockie.x, coockie.y) where coockie.alive == true: print("\(coockie.emoji)", terminator: "")
                        case(poultry.x, poultry.y) where poultry.alive == true: print("\(poultry.emoji)", terminator: "")
                        default: print("◽️", terminator:"")
                            }
                        }
                        print()
        }
    }
    
    init(lenght: Int, width: Int) {
        
        switch (lenght, width) {
        case (lenght, width) where lenght <= 2 && width <= 2:
            self.lenght = 4
            self.width = 4
        case (lenght, width) where lenght == 3 && width == 3:
            self.lenght = 4
            self.width = 4
        default:
            var newLenght: Int
            var newWidth: Int
            self.lenght = lenght <= 2 ? 4 : lenght
            newLenght = self.lenght
            self.width = width <= 2 ? 4 : width
            newWidth = self.width
            self.lenght = lenght >= 9 ? 9 : newLenght
            self.width = width >= 9 ? 9 : newWidth
        }

        
        switch (lenght, width) {
        case (lenght, width) where lenght <= 5 && width <= 5:
            eating.remove(at: 2)
            poultry.alive = false
            eating.remove(at: 1)
            coockie.alive = false
        case (lenght, width) where lenght <= 8 && width <= 8:
            eating.remove(at: 2)
            poultry.alive = false
        default: break
        }
        printRoom()
    }
}
var room = Room(lenght: 0, width: 0)






