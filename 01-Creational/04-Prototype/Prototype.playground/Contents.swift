// Define the prototype protocol
protocol Prototype {
    func clone() -> Prototype
}

// Define a class that conforms to the prototype protocol
class MyClass: Prototype {
    var name: String
    var number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    func clone() -> Prototype {
        return MyClass(name: self.name, number: self.number)
    }
}

// Create an instance of the class and clone it
let originalObject = MyClass(name: "Original Object", number: 1)
let clonedObject = originalObject.clone()

// Verify that the cloned object is a separate instance
print(originalObject === clonedObject) // false
