// The Product protocol defines the interface that all concrete products must implement.
protocol Product {
    func doStuff()
}

// Concrete Products implement the Product protocol.
class ConcreteProductA: Product {
    func doStuff() {
        print("Using Concrete Product A")
    }
}

class ConcreteProductB: Product {
    func doStuff() {
        print("Using Concrete Product B")
    }
}

// The Creator protocol declares the factory method, which returns an object of the Product protocol.
protocol Creator {
    func factoryMethod() -> Product
}

// Concrete Creators implement the Creator protocol and provide implementation for the factory method.
class ConcreteCreatorA: Creator {
    func factoryMethod() -> Product {
        return ConcreteProductA()
    }
}

class ConcreteCreatorB: Creator {
    func factoryMethod() -> Product {
        return ConcreteProductB()
    }
}

// Usage
let creatorA: Creator = ConcreteCreatorA()
let productA: Product = creatorA.factoryMethod()
productA.doStuff() // Output: Using Concrete Product A

let creatorB: Creator = ConcreteCreatorB()
let productB: Product = creatorB.factoryMethod()
productB.doStuff() // Output: Using Concrete Product B
