// The Component protocol defines the common interface for all components.
protocol Component {
    func operation() -> String
}

// The ConcreteComponent provides the basic implementation of the Component protocol.
class ConcreteComponent: Component {
    func operation() -> String {
        return "ConcreteComponent"
    }
}

// The Decorator class implements the Component protocol and keeps a reference to the wrapped Component.
class Decorator: Component {
    private let component: Component

    init(component: Component) {
        self.component = component
    }

    func operation() -> String {
        return component.operation()
    }
}

// Concrete Decorator adds additional behavior to the wrapped component.
class ConcreteDecoratorA: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorA(" + super.operation() + ")"
    }
}

class ConcreteDecoratorB: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorB(" + super.operation() + ")"
    }
}

// Usage example:
let component = ConcreteComponent()

let decoratorA = ConcreteDecoratorA(component: component)
let decoratorB = ConcreteDecoratorB(component: component)

print(decoratorA.operation()) // Output: "ConcreteDecoratorA(ConcreteComponent)"
print(decoratorB.operation()) // Output: "ConcreteDecoratorB(ConcreteComponent)"
