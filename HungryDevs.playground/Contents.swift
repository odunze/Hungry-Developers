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
        
    }
    
    func putDown() {
        
    }
}


class Developer {
    
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(leftSpoon: Spoon, rightSpoon: Spoon) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() { print("Developer is thinking") }
    
    func eat() {   print("Developer is eating") }
    
    func run() {
        
        think()
        eat()
    }
    
    
}
