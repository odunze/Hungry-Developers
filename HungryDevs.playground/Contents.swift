//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

let nibFile = NSNib.Name("MyView")
var topLevelObjects : NSArray?

Bundle.main.loadNibNamed(nibFile, owner:nil, topLevelObjects: &topLevelObjects)
let views = (topLevelObjects as! Array<Any>).filter { $0 is NSView }

// Present the view in Playground
PlaygroundPage.current.liveView = views[0] as! NSView

class Spoon {
    
    func pickUp() {
        
        lock.lock()
        
    }
    
    func putDown() {
        lock.unlock()
        
    }
}


class Developer {
    
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        leftSpoon.pickUp()
        print("\(name) has picked up the left spoon")
        
        rightSpoon.pickUp()
        print("\(name) has picked up the right spoon")

        print("\(name) is thinking")

    }
    
    func eat() {
        
        print("\(name) is eating")
        
        usleep(3000000)
        
        defer {
            leftSpoon.putDown()
            rightSpoon.putDown()
            print("\(name) put the spoons down")
        }
    }
    
    func run() {
        
        think()
        eat()
    }
}

let lock = NSLock()

let a = Spoon()
let b = Spoon()
let c = Spoon()
let d = Spoon()
let e = Spoon()


let developer1 = Developer(name: "Developer 1", leftSpoon: a, rightSpoon: b)
let developer2 = Developer(name: "Developer 2", leftSpoon: b, rightSpoon: c)
let developer3 = Developer(name: "Developer 3", leftSpoon: c, rightSpoon: d)
let developer4 = Developer(name: "Developer 4", leftSpoon: d, rightSpoon: e)
let developer5 = Developer(name: "Developer 5", leftSpoon: e, rightSpoon: a)

let team = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    team[$0].run()
}
