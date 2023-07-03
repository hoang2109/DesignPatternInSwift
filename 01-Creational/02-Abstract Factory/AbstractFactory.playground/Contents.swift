// Define the protocol for the product Button
protocol Button {
    func press()
}

// Define the concrete product for Light theme Button
class LightButton: Button {
    func press() {
        print("Light button pressed")
    }
}

// Define the concrete product for Dark theme Button
class DarkButton: Button {
    func press() {
        print("Dark button pressed")
    }
}

// Define the protocol for the product Label
protocol Label {
    func display()
}

// Define the concrete product for Light theme Label
class LightLabel: Label {
    func display() {
        print("Light label displayed")
    }
}

// Define the concrete product for Dark theme Label
class DarkLabel: Label {
    func display() {
        print("Dark label displayed")
    }
}

// Define the protocol for the abstract factory
protocol ThemeFactory {
    func createButton() -> Button
    func createLabel() -> Label
}

// Define the concrete factory for Light theme
class LightThemeFactory: ThemeFactory {
    func createButton() -> Button {
        return LightButton()
    }
    
    func createLabel() -> Label {
        return LightLabel()
    }
}

// Define the concrete factory for Dark theme
class DarkThemeFactory: ThemeFactory {
    func createButton() -> Button {
        return DarkButton()
    }
    
    func createLabel() -> Label {
        return DarkLabel()
    }
}

// Usage
let lightThemeFactory = LightThemeFactory()
let lightButton = lightThemeFactory.createButton()
let lightLabel = lightThemeFactory.createLabel()

lightButton.press()
lightLabel.display()

let darkThemeFactory = DarkThemeFactory()
let darkButton = darkThemeFactory.createButton()
let darkLabel = darkThemeFactory.createLabel()

darkButton.press()
darkLabel.display()
