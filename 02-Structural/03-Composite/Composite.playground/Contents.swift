protocol Component: AnyObject {
    func operation()
}

class Leaf: Component {
    func operation() {
        print("Leaf operation")
    }
}

class Composite: Component {
    private var children = [Component]()
    
    func add(child: Component) {
        children.append(child)
    }
    
    func remove(child: Component) {
        if let index = children.firstIndex(where: { $0 === child }) {
            children.remove(at: index)
        }
    }
    
    func operation() {
        print("Composite operation")
        children.forEach { $0.operation() }
    }
}

// Usage:
let leaf1 = Leaf()
let leaf2 = Leaf()
let composite1 = Composite()
composite1.add(child: leaf1)
composite1.add(child: leaf2)

let leaf3 = Leaf()
let composite2 = Composite()
composite2.add(child: leaf3)
composite2.add(child: composite1)

composite2.operation()
