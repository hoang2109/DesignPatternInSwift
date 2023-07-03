// Product class
class Pizza {
    var size: String?
    var cheese: String?
    var topping: String?
}

// Builder protocol
protocol PizzaBuilder {
    var pizza: Pizza { get }
    func setSize(_ size: String) -> PizzaBuilder
    func setCheese(_ cheese: String) -> PizzaBuilder
    func setTopping(_ topping: String) -> PizzaBuilder
}

// Concrete builder
class HawaiianPizzaBuilder: PizzaBuilder {
    var pizza = Pizza()
    
    func setSize(_ size: String) -> PizzaBuilder {
        pizza.size = size
        return self
    }
    
    func setCheese(_ cheese: String) -> PizzaBuilder {
        pizza.cheese = cheese
        return self
    }
    
    func setTopping(_ topping: String) -> PizzaBuilder {
        pizza.topping = topping
        return self
    }
}

// Director class
class Waiter {
    private var pizzaBuilder: PizzaBuilder
    
    init(pizzaBuilder: PizzaBuilder) {
        self.pizzaBuilder = pizzaBuilder
    }
    
    func getPizza() -> Pizza {
        return pizzaBuilder.pizza
    }
    
    func constructPizza(size: String, cheese: String, topping: String) {
        pizzaBuilder.setSize(size)
        pizzaBuilder.setCheese(cheese)
        pizzaBuilder.setTopping(topping)
    }
}

// Usage
let hawaiianPizzaBuilder = HawaiianPizzaBuilder()
let waiter = Waiter(pizzaBuilder: hawaiianPizzaBuilder)

waiter.constructPizza(size: "Medium", cheese: "Mozzarella", topping: "Pineapple")
let hawaiianPizza = waiter.getPizza()
print(hawaiianPizza.size ?? "")  // Output: Medium
print(hawaiianPizza.cheese ?? "")  // Output: Mozzarella
print(hawaiianPizza.topping ?? "")  // Output: Pineapple
